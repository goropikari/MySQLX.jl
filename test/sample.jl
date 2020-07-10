using ProtoBuf: ProtoBuf
using Sockets: Sockets
using SHA: SHA
using MySQLX: MySQLX

function read_packet(sock)
    len_little_endian = read(sock, 4)
    len = reinterpret(Int32, len_little_endian)[] - 1
    typ = read(sock, 1)
    payload = read(sock, len)
    return typ, payload
end

function serialize_to_string(protobuf)
    iob = PipeBuffer()
    ProtoBuf.writeproto(iob, protobuf)
    return iob.data
end

function ctos(sock, typ::Integer, payload::Vector{UInt8})
    len = reinterpret(UInt8, [Int32(length(payload) + 1)])
    typ_uint8 = [UInt8(typ)]
    write(sock, vcat(len, typ_uint8, payload))
end

function zigzag_decode(i)
    return xor((i >>> 1), -(i & 1))
end

host = get(ENV, "MYSQL_HOST", "127.0.0.1")
user = "root"
password = "test"
port = 33060
sock = Sockets.connect(host, port)

# S -> C: Notice
read_packet(sock)

# C -> S: SESS_AUTHENTICATE_START
auth = MySQLX.Session.AuthenticateStart()
auth.mech_name = "MYSQL41"
payload = serialize_to_string(auth)
SESS_AUTHENTICATE_START = 4
ctos(sock, SESS_AUTHENTICATE_START, payload)

# S -> C: AuthenticateContinue
typ, payload = read_packet(sock)
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
auth_conti = MySQLX.Session.AuthenticateContinue()
auth_conti.auth_data = auth_data
payload = serialize_to_string(auth_conti)
len = length(payload) + 1
len_little_endian = reinterpret(UInt8, [Int32(len)])
SESS_AUTHENTICATE_CONTINUE  = 5
typ = [UInt8(SESS_AUTHENTICATE_CONTINUE)]
write(sock, vcat(len_little_endian, typ, payload))

# S -> C: Notice
typ, payload = read_packet(sock)


# S -> C: SESS_AUTHENTICATE_OK = 4
typ, payload = read_packet(sock)
auth_ok = MySQLX.Session.AuthenticateOk()
ProtoBuf.readproto(PipeBuffer(payload), auth_ok)

# C -> S: SQL_STMT_EXECUTE = 12
stmt_execute = MySQLX.Sql.StmtExecute()
query = "select * from foo.bar"
stmt_execute.stmt = UInt8.(transcode(UInt8, query))
stmt_execute.compact_metadata = false
payload = serialize_to_string(stmt_execute)
len = Int32(length(payload) + 1)
len_little_endian = reinterpret(UInt8, [len])
SQL_STMT_EXECUTE = 12
typ = [UInt8(SQL_STMT_EXECUTE)]
write(sock, vcat(len_little_endian, typ, payload))


# S -> C: RESULTSET_COLUMN_META_DATA = 12
typ, payload = read_packet(sock)
resultset_id = MySQLX.Resultset.ColumnMetaData()
ProtoBuf.readproto(PipeBuffer(payload), resultset_id)
println("type: $(resultset_id._type)")
println("name: $(String(copy(resultset_id.name)))")
println("schema: $(String(copy(resultset_id.schema)))")
println("table: $(String(copy(resultset_id.table)))")

typ, payload = read_packet(sock)
resultset_name = MySQLX.Resultset.ColumnMetaData()
ProtoBuf.readproto(PipeBuffer(payload), resultset_name)
println("type: $(resultset_name._type)")
println("name: $(String(copy(resultset_name.name)))")
println("schema: $(String(copy(resultset_name.schema)))")
println("table: $(String(copy(resultset_name.table)))")

# RESULTSET_ROW = 13
typ, payload = read_packet(sock)
row1 = MySQLX.Resultset.Row()
ProtoBuf.readproto(PipeBuffer(payload), row1)
println("row1_id = $(zigzag_decode(row1.field[1][]))")
println("row1_name = $(String(copy(row1.field[2])))")

typ, payload = read_packet(sock)
row2 = MySQLX.Resultset.Row()
ProtoBuf.readproto(PipeBuffer(payload), row2)
println("row2_id = $(zigzag_decode(row2.field[1][]))")
println("row2_name = $(String(copy(row2.field[2])))")

# RESULTSET_FETCH_DONE = 14
typ, payload = read_packet(sock)

# Notice
typ, payload = read_packet(sock)

# SQL_STMT_EXECUTE_OK = 17
typ, payload = read_packet(sock)

# C -> S: SESS_CLOSE = 7
SESS_CLOSE = 7
typ = UInt8(SESS_CLOSE)
write(sock, UInt8[0x01, 0x00, 0x00, 0x00, typ])

# S -> C: OK = 0
typ, payload = read_packet(sock)

close(sock)
