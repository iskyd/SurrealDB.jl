cd(@__DIR__)

using Test
using Random

Random.seed!(42)

enabled_tests = lowercase.(ARGS)
function addtests(fname)
    key = lowercase(splitext(fname)[1])
    if isempty(enabled_tests) || key in enabled_tests
        Random.seed!(42)
        include(fname)
    end
end

addtests("http_client.jl")