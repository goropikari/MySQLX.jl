# syntax: proto2
using ProtoBuf
import ProtoBuf.meta
import ._ProtoBuf_Top_.Mysqlx

mutable struct AuthenticateStart <: ProtoType
    mech_name::AbstractString
    auth_data::Array{UInt8,1}
    initial_response::Array{UInt8,1}
    AuthenticateStart(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct AuthenticateStart
const __req_AuthenticateStart = Symbol[:mech_name]
meta(t::Type{AuthenticateStart}) = meta(t, __req_AuthenticateStart, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct AuthenticateContinue <: ProtoType
    auth_data::Array{UInt8,1}
    AuthenticateContinue(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct AuthenticateContinue
const __req_AuthenticateContinue = Symbol[:auth_data]
meta(t::Type{AuthenticateContinue}) = meta(t, __req_AuthenticateContinue, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct AuthenticateOk <: ProtoType
    auth_data::Array{UInt8,1}
    AuthenticateOk(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct AuthenticateOk

mutable struct Reset <: ProtoType
    keep_open::Bool
    Reset(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Reset
const __val_Reset = Dict(:keep_open => false)
meta(t::Type{Reset}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, __val_Reset, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct Close <: ProtoType
    Close(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Close

export AuthenticateStart, AuthenticateContinue, AuthenticateOk, Reset, Close
