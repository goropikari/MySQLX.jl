# syntax: proto2
using ProtoBuf
import ProtoBuf.meta
import ..Mysqlx
import ._ProtoBuf_Top_.Mysqlx

struct __enum_DataModel <: ProtoEnum
    DOCUMENT::Int32
    TABLE::Int32
    __enum_DataModel() = new(1,2)
end #struct __enum_DataModel
const DataModel = __enum_DataModel()

struct __enum_ViewAlgorithm <: ProtoEnum
    UNDEFINED::Int32
    MERGE::Int32
    TEMPTABLE::Int32
    __enum_ViewAlgorithm() = new(1,2,3)
end #struct __enum_ViewAlgorithm
const ViewAlgorithm = __enum_ViewAlgorithm()

struct __enum_ViewSqlSecurity <: ProtoEnum
    INVOKER::Int32
    DEFINER::Int32
    __enum_ViewSqlSecurity() = new(1,2)
end #struct __enum_ViewSqlSecurity
const ViewSqlSecurity = __enum_ViewSqlSecurity()

struct __enum_ViewCheckOption <: ProtoEnum
    LOCAL::Int32
    CASCADED::Int32
    __enum_ViewCheckOption() = new(1,2)
end #struct __enum_ViewCheckOption
const ViewCheckOption = __enum_ViewCheckOption()

mutable struct Column <: ProtoType
    name::AbstractString
    alias::AbstractString
    document_path::Base.Vector{Mysqlx._Expr.DocumentPathItem}
    Column(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Column

mutable struct Projection <: ProtoType
    source::Mysqlx._Expr.__Expr
    alias::AbstractString
    Projection(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Projection
const __req_Projection = Symbol[:source]
meta(t::Type{Projection}) = meta(t, __req_Projection, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct Collection <: ProtoType
    name::AbstractString
    schema::AbstractString
    Collection(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Collection
const __req_Collection = Symbol[:name]
meta(t::Type{Collection}) = meta(t, __req_Collection, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct Limit <: ProtoType
    row_count::UInt64
    offset::UInt64
    Limit(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Limit
const __req_Limit = Symbol[:row_count]
meta(t::Type{Limit}) = meta(t, __req_Limit, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct LimitExpr <: ProtoType
    row_count::Mysqlx._Expr.__Expr
    offset::Mysqlx._Expr.__Expr
    LimitExpr(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct LimitExpr
const __req_LimitExpr = Symbol[:row_count]
meta(t::Type{LimitExpr}) = meta(t, __req_LimitExpr, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

struct __enum_Order_Direction <: ProtoEnum
    ASC::Int32
    DESC::Int32
    __enum_Order_Direction() = new(1,2)
end #struct __enum_Order_Direction
const Order_Direction = __enum_Order_Direction()

mutable struct Order <: ProtoType
    expr::Mysqlx._Expr.__Expr
    direction::Int32
    Order(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Order
const __req_Order = Symbol[:expr]
const __val_Order = Dict(:direction => Order_Direction.ASC)
meta(t::Type{Order}) = meta(t, __req_Order, ProtoBuf.DEF_FNUM, __val_Order, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

struct __enum_UpdateOperation_UpdateType <: ProtoEnum
    SET::Int32
    ITEM_REMOVE::Int32
    ITEM_SET::Int32
    ITEM_REPLACE::Int32
    ITEM_MERGE::Int32
    ARRAY_INSERT::Int32
    ARRAY_APPEND::Int32
    MERGE_PATCH::Int32
    __enum_UpdateOperation_UpdateType() = new(1,2,3,4,5,6,7,8)
end #struct __enum_UpdateOperation_UpdateType
const UpdateOperation_UpdateType = __enum_UpdateOperation_UpdateType()

mutable struct UpdateOperation <: ProtoType
    source::Mysqlx._Expr.ColumnIdentifier
    operation::Int32
    value::Mysqlx._Expr.__Expr
    UpdateOperation(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct UpdateOperation
const __req_UpdateOperation = Symbol[:source,:operation]
meta(t::Type{UpdateOperation}) = meta(t, __req_UpdateOperation, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

struct __enum_Find_RowLock <: ProtoEnum
    SHARED_LOCK::Int32
    EXCLUSIVE_LOCK::Int32
    __enum_Find_RowLock() = new(1,2)
end #struct __enum_Find_RowLock
const Find_RowLock = __enum_Find_RowLock()

struct __enum_Find_RowLockOptions <: ProtoEnum
    NOWAIT::Int32
    SKIP_LOCKED::Int32
    __enum_Find_RowLockOptions() = new(1,2)
end #struct __enum_Find_RowLockOptions
const Find_RowLockOptions = __enum_Find_RowLockOptions()

mutable struct Find <: ProtoType
    collection::Collection
    data_model::Int32
    projection::Base.Vector{Projection}
    criteria::Mysqlx._Expr.__Expr
    args::Base.Vector{Mysqlx.Datatypes.Scalar}
    order::Base.Vector{Order}
    grouping::Base.Vector{Mysqlx._Expr.__Expr}
    grouping_criteria::Mysqlx._Expr.__Expr
    locking::Int32
    locking_options::Int32
    limit::Limit
    limit_expr::LimitExpr
    Find(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Find
const __req_Find = Symbol[:collection]
const __fnum_Find = Int[2,3,4,5,11,7,8,9,12,13,6,14]
meta(t::Type{Find}) = meta(t, __req_Find, __fnum_Find, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct Insert_TypedRow <: ProtoType
    field::Base.Vector{Mysqlx._Expr.__Expr}
    Insert_TypedRow(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Insert_TypedRow

mutable struct Insert <: ProtoType
    collection::Collection
    data_model::Int32
    projection::Base.Vector{Column}
    row::Base.Vector{Insert_TypedRow}
    args::Base.Vector{Mysqlx.Datatypes.Scalar}
    upsert::Bool
    Insert(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Insert
const __req_Insert = Symbol[:collection]
const __val_Insert = Dict(:upsert => false)
meta(t::Type{Insert}) = meta(t, __req_Insert, ProtoBuf.DEF_FNUM, __val_Insert, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct Update <: ProtoType
    collection::Collection
    data_model::Int32
    criteria::Mysqlx._Expr.__Expr
    args::Base.Vector{Mysqlx.Datatypes.Scalar}
    order::Base.Vector{Order}
    operation::Base.Vector{UpdateOperation}
    limit::Limit
    limit_expr::LimitExpr
    Update(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Update
const __req_Update = Symbol[:collection]
const __fnum_Update = Int[2,3,4,8,6,7,5,9]
meta(t::Type{Update}) = meta(t, __req_Update, __fnum_Update, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct Delete <: ProtoType
    collection::Collection
    data_model::Int32
    criteria::Mysqlx._Expr.__Expr
    args::Base.Vector{Mysqlx.Datatypes.Scalar}
    order::Base.Vector{Order}
    limit::Limit
    limit_expr::LimitExpr
    Delete(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct Delete
const __req_Delete = Symbol[:collection]
const __fnum_Delete = Int[1,2,3,6,5,4,7]
meta(t::Type{Delete}) = meta(t, __req_Delete, __fnum_Delete, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct CreateView <: ProtoType
    collection::Collection
    definer::AbstractString
    algorithm::Int32
    security::Int32
    check::Int32
    column::Base.Vector{AbstractString}
    stmt::Find
    replace_existing::Bool
    CreateView(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct CreateView
const __req_CreateView = Symbol[:collection,:stmt]
const __val_CreateView = Dict(:algorithm => ViewAlgorithm.UNDEFINED, :security => ViewSqlSecurity.DEFINER, :replace_existing => false)
meta(t::Type{CreateView}) = meta(t, __req_CreateView, ProtoBuf.DEF_FNUM, __val_CreateView, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct ModifyView <: ProtoType
    collection::Collection
    definer::AbstractString
    algorithm::Int32
    security::Int32
    check::Int32
    column::Base.Vector{AbstractString}
    stmt::Find
    ModifyView(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct ModifyView
const __req_ModifyView = Symbol[:collection]
meta(t::Type{ModifyView}) = meta(t, __req_ModifyView, ProtoBuf.DEF_FNUM, ProtoBuf.DEF_VAL, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

mutable struct DropView <: ProtoType
    collection::Collection
    if_exists::Bool
    DropView(; kwargs...) = (o=new(); fillunset(o); isempty(kwargs) || ProtoBuf._protobuild(o, kwargs); o)
end #mutable struct DropView
const __req_DropView = Symbol[:collection]
const __val_DropView = Dict(:if_exists => false)
meta(t::Type{DropView}) = meta(t, __req_DropView, ProtoBuf.DEF_FNUM, __val_DropView, true, ProtoBuf.DEF_PACK, ProtoBuf.DEF_WTYPES, ProtoBuf.DEF_ONEOFS, ProtoBuf.DEF_ONEOF_NAMES, ProtoBuf.DEF_FIELD_TYPES)

export DataModel, ViewAlgorithm, ViewSqlSecurity, ViewCheckOption, Column, Projection, Collection, Limit, LimitExpr, Order_Direction, Order, UpdateOperation_UpdateType, UpdateOperation, Find_RowLock, Find_RowLockOptions, Find, Insert_TypedRow, Insert, Update, Delete, CreateView, ModifyView, DropView
