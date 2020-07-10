# syntax: proto2
using ProtoBuf
import ProtoBuf.meta
import ._ProtoBuf_Top_.Mysqlx

struct __enum_Open_CtxOperation <: ProtoEnum
    EXPECT_CTX_COPY_PREV::Int32
    EXPECT_CTX_EMPTY::Int32
    __enum_Open_CtxOperation() = new(0,1)
end #struct __enum_Open_CtxOperation
const Open_CtxOperation = __enum_Open_CtxOperation()

struct __enum_Open_Condition_Key <: ProtoEnum
    EXPECT_NO_ERROR::Int32
    EXPECT_FIELD_EXIST::Int32
    EXPECT_DOCID_GENERATED::Int32
    __enum_Open_Condition_Key() = new(1,2,3)
end #struct __enum_Open_Condition_Key
const Open_Condition_Key = __enum_Open_Condition_Key()

struct __enum_Open_Condition_ConditionOperation <: ProtoEnum
    EXPECT_OP_SET::Int32
    EXPECT_OP_UNSET::Int32
    __enum_Open_Condition_ConditionOperation() = new(0,1)
end #struct __enum_Open_Condition_ConditionOperation
const Open_Condition_ConditionOperation = __enum_Open_Condition_ConditionOperation()

mutable struct Open_Condition <: ProtoType
    condition_key::UInt32
    condition_value::Array{UInt8,1}
    op::Int32
    Open_Condition(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Open_Condition
const __req_Open_Condition = Symbol[:condition_key]
const __val_Open_Condition = Dict(:op => Open_Condition_ConditionOperation.EXPECT_OP_SET)
meta(t::Type{Open_Condition}) = meta(t, __req_Open_Condition, ProtoBuf.DEF_FNUM, __val_Open_Condition, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct Open <: ProtoType
    op::Int32
    cond::Base.Vector{Open_Condition}
    Open(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Open
const __val_Open = Dict(:op => Open_CtxOperation.EXPECT_CTX_COPY_PREV)
meta(t::Type{Open}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_Open, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct Close <: ProtoType
    Close(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Close

export Open_CtxOperation, Open_Condition_Key, Open_Condition_ConditionOperation, Open_Condition, Open, Close
