# MySQLX

This is a toy implementation to study [MySQL X protocol](https://dev.mysql.com/doc/dev/mysql-server/latest/mysqlx_protocol.html).

# Local

MySQL server is launched with docker.
```
$ docker run --rm -e MYSQL_ROOT_PASSWORD=test -p 33060:33060 -p 3306:3306 -d mysql:8.0.20 mysqld --default-authentication-plugin=mysql_native_password
$ mysql -h db -uroot -ptest < test/ex.sql
$ julia --project=. -e 'using Pkg; Pkg.instantiate(); Pkg.test()'
```

# Inside container
```bash
$ docker-compose up -d
$ docker-compose exec ubuntu bash
$ mysql -h db -uroot -ptest < test/ex.sql
$ mysql -h db -uroot -ptest -e 'select * from foo.bar'
+------+------+
| id   | name |
+------+------+
|    1 | dog  |
|    2 | cat  |
+------+------+

$ julia --project=. test/sample.jl
type: 1
name: id
schema: foo
table: bar
type: 7
name: name
schema: foo
table: bar
row1_id = 1
row1_name = dog
row2_id = 2
row2_name = cat
```

## Packet Capture
```bash
$ ngrep -x -q '.' 'host db'
$ julia sample.jl
```


# Generating Julia files from proto files

```bash
$ git clone --depth 1 -b v0.8.0 https://github.com/JuliaIO/ProtoBuf.jl
$ git clone --depth 1 -b mysql-8.0.20 https://github.com/mysql/mysql-server
$ cp -r mysql-server/plugin/x/protocol/protobuf/ .
$ rm -rf mysql-server
$ sed -i 's/Any/_Any/g' protobuf/*.proto && \
$ sed -i 's/Array/_Array/g' protobuf/*.proto && \
$ sed -i 's/LimitExpr/Hoge/g' protobuf/*.proto && \
$ sed -i 's/Expr/_Expr/g' protobuf/*.proto && \
$ sed -i 's/message _Expr/message __Expr/g' protobuf/*.proto && \
$ sed -i 's/repeated _Expr/repeated __Expr/g' protobuf/*.proto && \
$ sed -i 's/required _Expr/required __Expr/g' protobuf/*.proto && \
$ sed -i 's/\._Expr /\.__Expr /g' protobuf/*.proto && \
$ sed -i 's/Hoge/LimitExpr/g' protobuf/*.proto && \
$ sed -i 's/server: Prepare/server: _Prepare/g' protobuf/*.proto && \
$ sed -i 's/message Prepare/message _Prepare/g' protobuf/*.proto && \
$ mkdir -p src/mysqlxpb
$ protoc -I=protobuf --plugin=protoc-gen-julia=ProtoBuf.jl/plugin/protoc-gen-julia --julia_out=src/mysqlxpb protobuf/*.proto
```
