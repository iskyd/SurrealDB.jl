cd(@__DIR__)

using SurrealDB
using Test, TestSetExtensions, SafeTestsets

@testset "SurrealDB.jl" begin
    @includetests ARGS #[(endswith(t, ".jl") && t[1:end-3]) for t in ARGS]
end
