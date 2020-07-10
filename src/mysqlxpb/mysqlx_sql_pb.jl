# syntax: proto2
using ProtoBuf
import ProtoBuf.meta
import ..Mysqlx
import ._ProtoBuf_Top_.Mysqlx

mutable struct StmtExecute <: ProtoType
    namespace::AbstractString
    stmt::Array{UInt8,1}
    args::Base.Vector{Mysqlx.Datatypes._Any}
    compact_metadata::Bool
    StmtExecute(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct StmtExecute
const __req_StmtExecute = Symbol[:stmt]
const __val_StmtExecute = Dict(:namespace => "sql", :compact_metadata => false)
const __fnum_StmtExecute = Int[3,1,2,4]
meta(t::Type{StmtExecute}) = meta(t, __req_StmtExecute, __fnum_StmtExecute, __val_StmtExecute, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct StmtExecuteOk <: ProtoType
    StmtExecuteOk(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct StmtExecuteOk

export StmtExecute, StmtExecuteOk
