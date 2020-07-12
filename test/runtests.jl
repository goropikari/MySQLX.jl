using MySQLX
using Test

@testset "MySQLX.jl" begin
    host = get(ENV, "MYSQL_ROOT", "127.0.0.1")
    user = "root"
    password = "test"
    conn = MySQLX.connect(host, user, password, port=33060)
    MySQLX.execute(conn, "DROP DATABASE foo")
    MySQLX.execute(conn, "CREATE DATABASE foo")
    MySQLX.execute(conn, "CREATE TABLE foo.bar (id int, name varchar(10))")
    MySQLX.execute(conn, "INSERT INTO foo.bar VALUES (1, 'dog'), (2, 'cat'), (10, 'hamster');")
    MySQLX.execute(conn, "select * from foo.bar")
    close(conn)
end
