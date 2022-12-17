using SurrealDB
using Documenter

DocMeta.setdocmeta!(SurrealDB, :DocTestSetup, :(using SurrealDB); recursive=true)

makedocs(;
    modules=[SurrealDB],
    authors="Mattia Careddu",
    repo="https://github.com/iskyd/SurrealDB.jl/blob/{commit}{path}#{line}",
    sitename="SurrealDB.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://iskyd.github.io/SurrealDB.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/iskyd/SurrealDB.jl",
    devbranch="dev",
    branch = "gh-pages",
)
