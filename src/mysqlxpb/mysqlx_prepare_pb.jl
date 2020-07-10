# syntax: proto2
using ProtoBuf
import ProtoBuf.meta
import ..Mysqlx
import ._ProtoBuf_Top_.Mysqlx

struct __enum__Prepare_OneOfMessage_Type <: ProtoEnum
    FIND::Int32
    INSERT::Int32
    UPDATE::Int32
    DELETE::Int32
    STMT::Int32
    __enum__Prepare_OneOfMessage_Type() = new(0,1,2,4,5)
end #struct __enum__Prepare_OneOfMessage_Type
const _Prepare_OneOfMessage_Type = __enum__Prepare_OneOfMessage_Type()

mutable struct _Prepare_OneOfMessage <: ProtoType
    _type::Int32
    find::Mysqlx.Crud.Find
    insert::Mysqlx.Crud.Insert
    update::Mysqlx.Crud.Update
    delete::Mysqlx.Crud.Delete
    stmt_execute::Mysqlx.Sql.StmtExecute
    _Prepare_OneOfMessage(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct _Prepare_OneOfMessage
const __req__Prepare_OneOfMessage = Symbol[:_type]
meta(t::Type{_Prepare_OneOfMessage}) = meta(t, __req__Prepare_OneOfMessage, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct _Prepare <: ProtoType
    stmt_id::UInt32
    stmt::_Prepare_OneOfMessage
    _Prepare(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct _Prepare
const __req__Prepare = Symbol[:stmt_id,:stmt]
meta(t::Type{_Prepare}) = meta(t, __req__Prepare, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct Execute <: ProtoType
    stmt_id::UInt32
    args::Base.Vector{Mysqlx.Datatypes._Any}
    compact_metadata::Bool
    Execute(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Execute
const __req_Execute = Symbol[:stmt_id]
const __val_Execute = Dict(:compact_metadata => false)
meta(t::Type{Execute}) = meta(t, __req_Execute, ProtoBuf.DEF_FNUM, __val_Execute, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct Deallocate <: ProtoType
    stmt_id::UInt32
    Deallocate(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Deallocate
const __req_Deallocate = Symbol[:stmt_id]
meta(t::Type{Deallocate}) = meta(t, __req_Deallocate, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

export _Prepare_OneOfMessage_Type, _Prepare_OneOfMessage, _Prepare, Execute, Deallocate
