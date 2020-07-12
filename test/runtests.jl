using MySQLX
using Test

@testset "MySQLX.jl" begin
    host = get(ENV, "MYSQL_ROOT", "127.0.0.1")
    user = "root"
    password = "test"
    conn = MySQLX.connect(host, user, password, port=33060)
    MySQLX.execute(conn, "select * from foo.bar")
    close(conn)
end
