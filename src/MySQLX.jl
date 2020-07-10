module MySQLX
    include("mysqlxpb/Mysqlx.jl")
    using .Mysqlx

    const Session   = Mysqlx.Session
    const Sql       = Mysqlx.Sql
    const Resultset = Mysqlx.Resultset

end #module
