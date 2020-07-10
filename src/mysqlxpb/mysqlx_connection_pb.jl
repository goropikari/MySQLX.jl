# syntax: proto2
using ProtoBuf
import ProtoBuf.meta
import ..Mysqlx
import ._ProtoBuf_Top_.Mysqlx

mutable struct Capability <: ProtoType
    name::AbstractString
    value::Mysqlx.Datatypes._Any
    Capability(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Capability
const __req_Capability = Symbol[:name,:value]
meta(t::Type{Capability}) = meta(t, __req_Capability, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct Capabilities <: ProtoType
    capabilities::Base.Vector{Capability}
    Capabilities(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Capabilities

mutable struct CapabilitiesGet <: ProtoType
    CapabilitiesGet(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct CapabilitiesGet

mutable struct CapabilitiesSet <: ProtoType
    capabilities::Capabilities
    CapabilitiesSet(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct CapabilitiesSet
const __req_CapabilitiesSet = Symbol[:capabilities]
meta(t::Type{CapabilitiesSet}) = meta(t, __req_CapabilitiesSet, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct Close <: ProtoType
    Close(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Close

mutable struct Compression <: ProtoType
    uncompressed_size::UInt64
    server_messages::Int32
    client_messages::Int32
    payload::Array{UInt8,1}
    Compression(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Compression
const __req_Compression = Symbol[:payload]
meta(t::Type{Compression}) = meta(t, __req_Compression, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

export Capability, Capabilities, CapabilitiesGet, CapabilitiesSet, Close, Compression
