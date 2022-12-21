@safetestset "http_client" begin
    using SurrealDB

    client = HTTPClient("url", "namespace", "db", "user", "password")
    @test client.url === "url"
    @test client.namespace === "namespace"
    @test client.database === "db"
    @test client.user === "user"
    @test client.password === "password"

    client = HTTPClient("url", "namespace", "db")
    @test client.url === "url"
    @test client.namespace === "namespace"
    @test client.database === "db"
    @test client.user === ""
    @test client.password === ""
end