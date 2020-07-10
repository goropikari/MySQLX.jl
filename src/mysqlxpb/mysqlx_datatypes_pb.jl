# syntax: proto2
using ProtoBuf
import ProtoBuf.meta

struct __enum_Scalar_Type <: ProtoEnum
    V_SINT::Int32
    V_UINT::Int32
    V_NULL::Int32
    V_OCTETS::Int32
    V_DOUBLE::Int32
    V_FLOAT::Int32
    V_BOOL::Int32
    V_STRING::Int32
    __enum_Scalar_Type() = new(1,2,3,4,5,6,7,8)
end #struct __enum_Scalar_Type
const Scalar_Type = __enum_Scalar_Type()

mutable struct Scalar_String <: ProtoType
    value::Array{UInt8,1}
    collation::UInt64
    Scalar_String(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Scalar_String
const __req_Scalar_String = Symbol[:value]
meta(t::Type{Scalar_String}) = meta(t, __req_Scalar_String, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct Scalar_Octets <: ProtoType
    value::Array{UInt8,1}
    content_type::UInt32
    Scalar_Octets(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Scalar_Octets
const __req_Scalar_Octets = Symbol[:value]
meta(t::Type{Scalar_Octets}) = meta(t, __req_Scalar_Octets, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct Scalar <: ProtoType
    _type::Int32
    v_signed_int::Int64
    v_unsigned_int::UInt64
    v_octets::Scalar_Octets
    v_double::Float64
    v_float::Float32
    v_bool::Bool
    v_string::Scalar_String
    Scalar(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Scalar
const __req_Scalar = Symbol[:_type]
const __fnum_Scalar = Int[1,2,3,5,6,7,8,9]
const __wtype_Scalar = Dict(:v_signed_int => :sint64)
meta(t::Type{Scalar}) = meta(t, __req_Scalar, __fnum_Scalar, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, __wtype_Scalar, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct Object_ObjectField <: ProtoType
    key::AbstractString
    value::Base.Any
    Object_ObjectField(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Object_ObjectField (has cyclic type dependency)
const __req_Object_ObjectField = Symbol[:key,:value]
const __ftype_Object_ObjectField = Dict(:value => "_Any")
meta(t::Type{Object_ObjectField}) = meta(t, __req_Object_ObjectField, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, __ftype_Object_ObjectField)

mutable struct Object <: ProtoType
    fld::Base.Vector{Object_ObjectField}
    Object(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Object (has cyclic type dependency)

mutable struct _Array <: ProtoType
    value::Base.Any
    _Array(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct _Array (has cyclic type dependency)
const __ftype__Array = Dict(:value => "Base.Vector{_Any}")
meta(t::Type{_Array}) = meta(t, ProtoBuf.DEF_REQ, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, __ftype__Array)

struct __enum__Any_Type <: ProtoEnum
    SCALAR::Int32
    OBJECT::Int32
    ARRAY::Int32
    __enum__Any_Type() = new(1,2,3)
end #struct __enum__Any_Type
const _Any_Type = __enum__Any_Type()

mutable struct _Any <: ProtoType
    _type::Int32
    scalar::Scalar
    obj::Object
    array::_Array
    _Any(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct _Any (has cyclic type dependency)
const __req__Any = Symbol[:_type]
meta(t::Type{_Any}) = meta(t, __req__Any, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

export Scalar_Type, Scalar_String, Scalar_Octets, Scalar, Object_ObjectField, Object, _Array, _Any_Type, _Any, Object_ObjectField, Object, _Array, _Any_Type, _Any
