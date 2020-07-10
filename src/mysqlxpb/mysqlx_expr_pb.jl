# syntax: proto2
using ProtoBuf
import ProtoBuf.meta
import ..Mysqlx

mutable struct Identifier <: ProtoType
    name::AbstractString
    schema_name::AbstractString
    Identifier(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Identifier
const __req_Identifier = Symbol[:name]
meta(t::Type{Identifier}) = meta(t, __req_Identifier, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

struct __enum_DocumentPathItem_Type <: ProtoEnum
    MEMBER::Int32
    MEMBER_ASTERISK::Int32
    ARRAY_INDEX::Int32
    ARRAY_INDEX_ASTERISK::Int32
    DOUBLE_ASTERISK::Int32
    __enum_DocumentPathItem_Type() = new(1,2,3,4,5)
end #struct __enum_DocumentPathItem_Type
const DocumentPathItem_Type = __enum_DocumentPathItem_Type()

mutable struct DocumentPathItem <: ProtoType
    _type::Int32
    value::AbstractString
    index::UInt32
    DocumentPathItem(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct DocumentPathItem
const __req_DocumentPathItem = Symbol[:_type]
meta(t::Type{DocumentPathItem}) = meta(t, __req_DocumentPathItem, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct ColumnIdentifier <: ProtoType
    document_path::Base.Vector{DocumentPathItem}
    name::AbstractString
    table_name::AbstractString
    schema_name::AbstractString
    ColumnIdentifier(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ColumnIdentifier

struct __enum___Expr_Type <: ProtoEnum
    IDENT::Int32
    LITERAL::Int32
    VARIABLE::Int32
    FUNC_CALL::Int32
    OPERATOR::Int32
    PLACEHOLDER::Int32
    OBJECT::Int32
    ARRAY::Int32
    __enum___Expr_Type() = new(1,2,3,4,5,6,7,8)
end #struct __enum___Expr_Type
const __Expr_Type = __enum___Expr_Type()

mutable struct __Expr <: ProtoType
    _type::Int32
    identifier::ColumnIdentifier
    variable::AbstractString
    literal::Mysqlx.Datatypes.Scalar
    function_call::Base.Any
    operator::Base.Any
    position::UInt32
    object::Base.Any
    array::Base.Any
    __Expr(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct __Expr (has cyclic type dependency)
const __req___Expr = Symbol[:_type]
const __ftype___Expr = Dict(:function_call => "FunctionCall", :operator => "Operator", :object => "Object", :array => "_Array")
meta(t::Type{__Expr}) = meta(t, __req___Expr, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, __ftype___Expr)

mutable struct FunctionCall <: ProtoType
    name::Identifier
    param::Base.Vector{__Expr}
    FunctionCall(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct FunctionCall (has cyclic type dependency)
const __req_FunctionCall = Symbol[:name]
meta(t::Type{FunctionCall}) = meta(t, __req_FunctionCall, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct Operator <: ProtoType
    name::AbstractString
    param::Base.Vector{__Expr}
    Operator(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Operator (has cyclic type dependency)
const __req_Operator = Symbol[:name]
meta(t::Type{Operator}) = meta(t, __req_Operator, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct Object_ObjectField <: ProtoType
    key::AbstractString
    value::__Expr
    Object_ObjectField(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Object_ObjectField (has cyclic type dependency)
const __req_Object_ObjectField = Symbol[:key,:value]
meta(t::Type{Object_ObjectField}) = meta(t, __req_Object_ObjectField, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct Object <: ProtoType
    fld::Base.Vector{Object_ObjectField}
    Object(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Object (has cyclic type dependency)

mutable struct _Array <: ProtoType
    value::Base.Vector{__Expr}
    _Array(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct _Array (has cyclic type dependency)

export __Expr_Type, __Expr, Identifier, DocumentPathItem_Type, DocumentPathItem, ColumnIdentifier, FunctionCall, Operator, Object_ObjectField, Object, _Array, __Expr_Type, __Expr, FunctionCall, Operator, Object_ObjectField, Object, _Array
