module MySQLX

using ProtoBuf: ProtoBuf
using Sockets: Sockets
using SHA: SHA

include("mysqlxpb/Mysqlx.jl")
using .Mysqlx
const Session   = Mysqlx.Session
const Sql       = Mysqlx.Sql
const Resultset = Mysqlx.Resultset

SESS_AUTHENTICATE_START = 4
SESS_AUTHENTICATE_CONTINUE  = 5

function _read_packet(sock)
    len_little_endian = read(sock, 4)
    len = reinterpret(Int32, len_little_endian)[] - 1
    typ = read(sock, 1)[]
    payload = read(sock, len)
    if (typ == 0x0b) # Notice
        return _read_packet(sock)
    end
    return typ, payload
end

function _serialize_to_string(protobuf)
    iob = PipeBuffer()
    ProtoBuf.writeproto(iob, protobuf)
    return iob.data
end

function _client_to_server(sock::Sockets.TCPSocket, typ::Integer, payload::Vector{UInt8})
    len = reinterpret(UInt8, [Int32(length(payload) + 1)])
    typ_uint8 = [UInt8(typ)]
    write(sock, vcat(len, typ_uint8, payload))
end

function _zigzag_decode(i)
    return xor((i >>> 1), -(i & 1))
end

mutable struct Connection
    sock
end


function connect(sock::Sockets.TCPSocket, host::String, user::String, password::String; db::String = "", port::Integer = 33060)
    # C -> S: SESS_AUTHENTICATE_START
    auth = Session.AuthenticateStart(mech_name = "MYSQL41")
    payload = _serialize_to_string(auth)
    _client_to_server(sock, SESS_AUTHENTICATE_START, payload)

    # S -> C: AuthenticateContinue
    typ, payload = _read_packet(sock)
    auth_conti = MySQLX.Session.AuthenticateContinue()
    ProtoBuf.readproto(PipeBuffer(payload), auth_conti)

    # C -> S: AuthenticateContinue
    challenge = auth_conti.auth_data
    x = SHA.sha1(password)
    y = SHA.sha1(vcat(challenge, SHA.sha1(x)))
    auth_data = xor.(x, y)
    auth_data = (x -> string(x, base=16, pad=2)).(auth_data)
    auth_data = UInt8.(transcode(UInt8, join(auth_data)))

    iob = PipeBuffer()
    write(iob, user)
    auth_data = vcat([0x00], iob.data, [0x00, 0x2a], auth_data, [0x00])
    auth_conti = MySQLX.Session.AuthenticateContinue(auth_data = auth_data)
    payload = _serialize_to_string(auth_conti)
    len = length(payload) + 1
    len_little_endian = reinterpret(UInt8, [Int32(len)])
    typ = UInt8(SESS_AUTHENTICATE_CONTINUE)
    # write(sock, vcat(len_little_endian, typ, payload))
    _client_to_server(sock, typ, payload)


    # S -> C: SESS_AUTHENTICATE_OK = 4
    typ, payload = _read_packet(sock)
    if typ == 0x04
        # auth_ok = MySQLX.Session.AuthenticateOk()
        # ProtoBuf.readproto(PipeBuffer(payload), auth_ok)
        return Connection(sock)
    else
        error()
    end
end
connect(host::String, user::String, password::String; db::String="", port::Integer=33060) = connect(Sockets.connect(host, port), host, user, password, db=db, port=port)

function execute(conn::Connection, sql)
    # C -> S: SQL_STMT_EXECUTE = 12
    stmt_execute = MySQLX.Sql.StmtExecute()
    stmt_execute.stmt = UInt8.(transcode(UInt8, sql))
    stmt_execute.compact_metadata = false
    payload = _serialize_to_string(stmt_execute)
    len = Int32(length(payload) + 1)
    len_little_endian = reinterpret(UInt8, [len])
    SQL_STMT_EXECUTE = 12
    typ = UInt8(SQL_STMT_EXECUTE)
    _client_to_server(conn.sock, typ, payload)
    _parse_resultset(conn)
end

function _parse_resultset(conn::Connection)
    # S -> C: RESULTSET_COLUMN_META_DATA = 12
    col_names = String[]
    typ, payload = _read_packet(conn.sock)
    while typ == 12
        resultset_id = MySQLX.Resultset.ColumnMetaData()
        ProtoBuf.readproto(PipeBuffer(payload), resultset_id)
        println("type: $(resultset_id._type)")
        println("name: $(String(copy(resultset_id.name)))")
        println("schema: $(String(copy(resultset_id.schema)))")
        println("table: $(String(copy(resultset_id.table)))")
        push!(col_names, String(copy(resultset_id.name)))
        typ, payload = _read_packet(conn.sock)
    end

    # RESULTSET_ROW = 13
    # typ, payload = _read_packet(conn.sock)
    while typ == 13
        row = MySQLX.Resultset.Row()
        ProtoBuf.readproto(PipeBuffer(payload), row)
        for (col, field) in zip(col_names, row.field)
            println("$(col) $(field)")
        end
        typ, payload = _read_packet(conn.sock)
    end

    # RESULTSET_FETCH_DONE = 14
    typ

    # SQL_STMT_EXECUTE_OK = 17
    typ, payload = _read_packet(conn.sock)

    nothing
end

function Base.close(conn::Connection)
    SESS_CLOSE = 7
    typ = UInt8(SESS_CLOSE)
    _client_to_server(conn.sock, typ, UInt8[])

    typ, payload = _read_packet(conn.sock)
    if typ == 0 # OK
        nothing
    else
        println(typ)
        error()
    end
    close(conn.sock)
end


end #module
