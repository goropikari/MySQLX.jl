# syntax: proto2
using ProtoBuf
import ProtoBuf.meta
import ._ProtoBuf_Top_.Mysqlx
import ..Mysqlx

struct __enum_Open_OneOfMessage_Type <: ProtoEnum
    PREPARE_EXECUTE::Int32
    __enum_Open_OneOfMessage_Type() = new(0)
end #struct __enum_Open_OneOfMessage_Type
const Open_OneOfMessage_Type = __enum_Open_OneOfMessage_Type()

mutable struct Open_OneOfMessage <: ProtoType
    _type::Int32
    prepare_execute::Mysqlx.Prepare.Execute
    Open_OneOfMessage(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Open_OneOfMessage
const __req_Open_OneOfMessage = Symbol[:_type]
meta(t::Type{Open_OneOfMessage}) = meta(t, __req_Open_OneOfMessage, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct Open <: ProtoType
    cursor_id::UInt32
    stmt::Open_OneOfMessage
    fetch_rows::UInt64
    Open(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Open
const __req_Open = Symbol[:cursor_id,:stmt]
const __fnum_Open = Int[1,4,5]
meta(t::Type{Open}) = meta(t, __req_Open, __fnum_Open, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct Fetch <: ProtoType
    cursor_id::UInt32
    fetch_rows::UInt64
    Fetch(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Fetch
const __req_Fetch = Symbol[:cursor_id]
const __fnum_Fetch = Int[1,5]
meta(t::Type{Fetch}) = meta(t, __req_Fetch, __fnum_Fetch, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct Close <: ProtoType
    cursor_id::UInt32
    Close(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Close
const __req_Close = Symbol[:cursor_id]
meta(t::Type{Close}) = meta(t, __req_Close, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

export Open_OneOfMessage_Type, Open_OneOfMessage, Open, Fetch, Close
