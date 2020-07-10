# syntax: proto2
using ProtoBuf
import ProtoBuf.meta
import ._ProtoBuf_Top_.Mysqlx

struct __enum_ContentType_BYTES <: ProtoEnum
    GEOMETRY::Int32
    JSON::Int32
    XML::Int32
    __enum_ContentType_BYTES() = new(1,2,3)
end #struct __enum_ContentType_BYTES
const ContentType_BYTES = __enum_ContentType_BYTES()

struct __enum_ContentType_DATETIME <: ProtoEnum
    DATE::Int32
    DATETIME::Int32
    __enum_ContentType_DATETIME() = new(1,2)
end #struct __enum_ContentType_DATETIME
const ContentType_DATETIME = __enum_ContentType_DATETIME()

mutable struct FetchDoneMoreOutParams <: ProtoType
    FetchDoneMoreOutParams(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct FetchDoneMoreOutParams

mutable struct FetchDoneMoreResultsets <: ProtoType
    FetchDoneMoreResultsets(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct FetchDoneMoreResultsets

mutable struct FetchDone <: ProtoType
    FetchDone(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct FetchDone

mutable struct FetchSuspended <: ProtoType
    FetchSuspended(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct FetchSuspended

struct __enum_ColumnMetaData_FieldType <: ProtoEnum
    SINT::Int32
    UINT::Int32
    DOUBLE::Int32
    FLOAT::Int32
    BYTES::Int32
    TIME::Int32
    DATETIME::Int32
    SET::Int32
    ENUM::Int32
    BIT::Int32
    DECIMAL::Int32
    __enum_ColumnMetaData_FieldType() = new(1,2,5,6,7,10,12,15,16,17,18)
end #struct __enum_ColumnMetaData_FieldType
const ColumnMetaData_FieldType = __enum_ColumnMetaData_FieldType()

mutable struct ColumnMetaData <: ProtoType
    _type::Int32
    name::Array{UInt8,1}
    original_name::Array{UInt8,1}
    table::Array{UInt8,1}
    original_table::Array{UInt8,1}
    schema::Array{UInt8,1}
    catalog::Array{UInt8,1}
    collation::UInt64
    fractional_digits::UInt32
    length::UInt32
    flags::UInt32
    content_type::UInt32
    ColumnMetaData(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ColumnMetaData
const __req_ColumnMetaData = Symbol[:_type]
meta(t::Type{ColumnMetaData}) = meta(t, __req_ColumnMetaData, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct Row <: ProtoType
    field::Base.Vector{Array{UInt8,1}}
    Row(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Row

export ContentType_BYTES, ContentType_DATETIME, FetchDoneMoreOutParams, FetchDoneMoreResultsets, FetchDone, FetchSuspended, ColumnMetaData_FieldType, ColumnMetaData, Row
