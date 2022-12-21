```@meta
CurrentModule = SurrealDB
```

# SurrealDB
Unofficial Julia client for [SurrealDB](https://surrealdb.com/)

#### HttpClient

```
using SurrealDB
client = HttpClient("url", "namespace", "database", "user", "pass")
```

##### execute
Execute SQL String using HTTP.
Returns a vector of Dict{String, Any}
```
execute(client, "SELECT * FROM artist")
```

##### select
Select all or key from a specific table.
Returns a vector of Dict{String, Any}
```
select(client, "artist")
select(client, "artist", "suzgzwj06w2b48xu0rpj")
> 1-element Vector{Any}:
  Dict{String, Any}("name" => "john", "id" => "artist:suzgzwj06w2b48xu0rpj")
```

##### create_record
Create a record on specified table. Record is represented by a Dict()
```
create_record(client, "artist", Dict("name" => "john"))
```

##### update_record
Update a record identified by table and key. The record is specified using Dict(). It is possible to use patch or put (see SurrealDB documentation for more details)
```
update_record(client, "artist", "suzgzwj06w2b48xu0rpj", Dict("name" => "mattia"), patch=true)
```

##### delete_record
Delete record identified by table and key.
```
delete_record(client, "artist", "suzgzwj06w2b48xu0rpj")
```

##### delete_all
Delete all records in a table
```
delete_all(client, "artist")
```

Documentation for [SurrealDB.jl](https://github.com/iskyd/SurrealDB.jl).

```@index
```

```@autodocs
Modules = [SurrealDB]
```
