var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = SurrealDB","category":"page"},{"location":"#SurrealDB","page":"Home","title":"SurrealDB","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Unofficial Julia client for SurrealDB","category":"page"},{"location":"#HttpClient","page":"Home","title":"HttpClient","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"using SurrealDB\nclient = HttpClient(\"url\", \"namespace\", \"database\", \"user\", \"pass\")","category":"page"},{"location":"#execute","page":"Home","title":"execute","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Execute SQL String using HTTP. Returns a vector of Dict{String, Any}","category":"page"},{"location":"","page":"Home","title":"Home","text":"execute(client, \"SELECT * FROM artist\")","category":"page"},{"location":"#select","page":"Home","title":"select","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Select all or key from a specific table. Returns a vector of Dict{String, Any}","category":"page"},{"location":"","page":"Home","title":"Home","text":"select(client, \"artist\")\nselect(client, \"artist\", \"suzgzwj06w2b48xu0rpj\")\n> 1-element Vector{Any}:\n  Dict{String, Any}(\"name\" => \"john\", \"id\" => \"artist:suzgzwj06w2b48xu0rpj\")","category":"page"},{"location":"#create_record","page":"Home","title":"create_record","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Create a record on specified table. Record is represented by a Dict()","category":"page"},{"location":"","page":"Home","title":"Home","text":"create_record(client, \"artist\", Dict(\"name\" => \"john\"))","category":"page"},{"location":"#update_record","page":"Home","title":"update_record","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Update a record identified by table and key. The record is specified using Dict(). It is possible to use patch or put (see SurrealDB documentation for more details)","category":"page"},{"location":"","page":"Home","title":"Home","text":"update_record(client, \"artist\", \"suzgzwj06w2b48xu0rpj\", Dict(\"name\" => \"mattia\"), patch=true)","category":"page"},{"location":"#delete_record","page":"Home","title":"delete_record","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Delete record identified by table and key.","category":"page"},{"location":"","page":"Home","title":"Home","text":"delete_record(client, \"artist\", \"suzgzwj06w2b48xu0rpj\")","category":"page"},{"location":"#delete_all","page":"Home","title":"delete_all","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Delete all records in a table","category":"page"},{"location":"","page":"Home","title":"Home","text":"delete_all(client, \"artist\")","category":"page"},{"location":"","page":"Home","title":"Home","text":"Documentation for SurrealDB.jl.","category":"page"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [SurrealDB]","category":"page"}]
}