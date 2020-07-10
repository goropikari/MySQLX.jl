# syntax: proto2
using ProtoBuf
import ProtoBuf.meta
import ProtoBuf.google.protobuf

struct __enum_ClientMessages_Type <: ProtoEnum
    CON_CAPABILITIES_GET::Int32
    CON_CAPABILITIES_SET::Int32
    CON_CLOSE::Int32
    SESS_AUTHENTICATE_START::Int32
    SESS_AUTHENTICATE_CONTINUE::Int32
    SESS_RESET::Int32
    SESS_CLOSE::Int32
    SQL_STMT_EXECUTE::Int32
    CRUD_FIND::Int32
    CRUD_INSERT::Int32
    CRUD_UPDATE::Int32
    CRUD_DELETE::Int32
    EXPECT_OPEN::Int32
    EXPECT_CLOSE::Int32
    CRUD_CREATE_VIEW::Int32
    CRUD_MODIFY_VIEW::Int32
    CRUD_DROP_VIEW::Int32
    PREPARE_PREPARE::Int32
    PREPARE_EXECUTE::Int32
    PREPARE_DEALLOCATE::Int32
    CURSOR_OPEN::Int32
    CURSOR_CLOSE::Int32
    CURSOR_FETCH::Int32
    COMPRESSION::Int32
    __enum_ClientMessages_Type() = new(1,2,3,4,5,6,7,12,17,18,19,20,24,25,30,31,32,40,41,42,43,44,45,46)
end #struct __enum_ClientMessages_Type
const ClientMessages_Type = __enum_ClientMessages_Type()

mutable struct ClientMessages <: ProtoType
    ClientMessages(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ClientMessages

struct __enum_ServerMessages_Type <: ProtoEnum
    OK::Int32
    ERROR::Int32
    CONN_CAPABILITIES::Int32
    SESS_AUTHENTICATE_CONTINUE::Int32
    SESS_AUTHENTICATE_OK::Int32
    NOTICE::Int32
    RESULTSET_COLUMN_META_DATA::Int32
    RESULTSET_ROW::Int32
    RESULTSET_FETCH_DONE::Int32
    RESULTSET_FETCH_SUSPENDED::Int32
    RESULTSET_FETCH_DONE_MORE_RESULTSETS::Int32
    SQL_STMT_EXECUTE_OK::Int32
    RESULTSET_FETCH_DONE_MORE_OUT_PARAMS::Int32
    COMPRESSION::Int32
    __enum_ServerMessages_Type() = new(0,1,2,3,4,11,12,13,14,15,16,17,18,19)
end #struct __enum_ServerMessages_Type
const ServerMessages_Type = __enum_ServerMessages_Type()

mutable struct ServerMessages <: ProtoType
    ServerMessages(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ServerMessages

mutable struct Ok <: ProtoType
    msg::AbstractString
    Ok(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Ok

struct __enum_Error_Severity <: ProtoEnum
    ERROR::Int32
    FATAL::Int32
    __enum_Error_Severity() = new(0,1)
end #struct __enum_Error_Severity
const Error_Severity = __enum_Error_Severity()

mutable struct Error <: ProtoType
    severity::Int32
    code::UInt32
    sql_state::AbstractString
    msg::AbstractString
    Error(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Error
const __req_Error = Symbol[:code,:sql_state,:msg]
const __val_Error = Dict(:severity => Error_Severity.ERROR)
const __fnum_Error = Int[1,2,4,3]
meta(t::Type{Error}) = meta(t, __req_Error, __fnum_Error, __val_Error, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

export ClientMessages_Type, ClientMessages, ServerMessages_Type, ServerMessages, Ok, Error_Severity, Error
