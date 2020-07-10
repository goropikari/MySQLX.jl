# syntax: proto2
using ProtoBuf
import ProtoBuf.meta
import ..Mysqlx
import ._ProtoBuf_Top_.Mysqlx

struct __enum_Frame_Scope <: ProtoEnum
    GLOBAL::Int32
    LOCAL::Int32
    __enum_Frame_Scope() = new(1,2)
end #struct __enum_Frame_Scope
const Frame_Scope = __enum_Frame_Scope()

struct __enum_Frame_Type <: ProtoEnum
    WARNING::Int32
    SESSION_VARIABLE_CHANGED::Int32
    SESSION_STATE_CHANGED::Int32
    GROUP_REPLICATION_STATE_CHANGED::Int32
    SERVER_HELLO::Int32
    __enum_Frame_Type() = new(1,2,3,4,5)
end #struct __enum_Frame_Type
const Frame_Type = __enum_Frame_Type()

mutable struct Frame <: ProtoType
    _type::UInt32
    scope::Int32
    payload::Array{UInt8,1}
    Frame(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Frame
const __req_Frame = Symbol[:_type]
const __val_Frame = Dict(:scope => Frame_Scope.GLOBAL)
meta(t::Type{Frame}) = meta(t, __req_Frame, ProtoBuf.DEF_FNUM, __val_Frame, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

struct __enum_Warning_Level <: ProtoEnum
    NOTE::Int32
    WARNING::Int32
    ERROR::Int32
    __enum_Warning_Level() = new(1,2,3)
end #struct __enum_Warning_Level
const Warning_Level = __enum_Warning_Level()

mutable struct Warning <: ProtoType
    level::Int32
    code::UInt32
    msg::AbstractString
    Warning(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Warning
const __req_Warning = Symbol[:code,:msg]
const __val_Warning = Dict(:level => Warning_Level.WARNING)
meta(t::Type{Warning}) = meta(t, __req_Warning, ProtoBuf.DEF_FNUM, __val_Warning, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct SessionVariableChanged <: ProtoType
    param::AbstractString
    value::Mysqlx.Datatypes.Scalar
    SessionVariableChanged(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SessionVariableChanged
const __req_SessionVariableChanged = Symbol[:param]
meta(t::Type{SessionVariableChanged}) = meta(t, __req_SessionVariableChanged, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

struct __enum_SessionStateChanged_Parameter <: ProtoEnum
    CURRENT_SCHEMA::Int32
    ACCOUNT_EXPIRED::Int32
    GENERATED_INSERT_ID::Int32
    ROWS_AFFECTED::Int32
    ROWS_FOUND::Int32
    ROWS_MATCHED::Int32
    TRX_COMMITTED::Int32
    TRX_ROLLEDBACK::Int32
    PRODUCED_MESSAGE::Int32
    CLIENT_ID_ASSIGNED::Int32
    GENERATED_DOCUMENT_IDS::Int32
    __enum_SessionStateChanged_Parameter() = new(1,2,3,4,5,6,7,9,10,11,12)
end #struct __enum_SessionStateChanged_Parameter
const SessionStateChanged_Parameter = __enum_SessionStateChanged_Parameter()

mutable struct SessionStateChanged <: ProtoType
    param::Int32
    value::Base.Vector{Mysqlx.Datatypes.Scalar}
    SessionStateChanged(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct SessionStateChanged
const __req_SessionStateChanged = Symbol[:param]
meta(t::Type{SessionStateChanged}) = meta(t, __req_SessionStateChanged, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

struct __enum_GroupReplicationStateChanged_Type <: ProtoEnum
    MEMBERSHIP_QUORUM_LOSS::Int32
    MEMBERSHIP_VIEW_CHANGE::Int32
    MEMBER_ROLE_CHANGE::Int32
    MEMBER_STATE_CHANGE::Int32
    __enum_GroupReplicationStateChanged_Type() = new(1,2,3,4)
end #struct __enum_GroupReplicationStateChanged_Type
const GroupReplicationStateChanged_Type = __enum_GroupReplicationStateChanged_Type()

mutable struct GroupReplicationStateChanged <: ProtoType
    _type::UInt32
    view_id::AbstractString
    GroupReplicationStateChanged(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct GroupReplicationStateChanged
const __req_GroupReplicationStateChanged = Symbol[:_type]
meta(t::Type{GroupReplicationStateChanged}) = meta(t, __req_GroupReplicationStateChanged, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct ServerHello <: ProtoType
    ServerHello(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ServerHello

export Frame_Scope, Frame_Type, Frame, Warning_Level, Warning, SessionVariableChanged, SessionStateChanged_Parameter, SessionStateChanged, GroupReplicationStateChanged_Type, GroupReplicationStateChanged, ServerHello
