using HTTP

export HTTPClient, execute

struct HTTPClient
    url::String
    namespace::String
    database::String
    username::String
    password::String
end

function HTTPClient(url::String, namespace::String, database::String, username::String, password::String)
    return HTTPClient(url, namespace, database, username, password)
end

function HTTPClient(url::String, namespace::String, database::String)
    return HTTPClient(url, namespace, database, "", "")
end

function execute(client::HTTPClient, query::String)
    headers = Dict("Content-Type" => "application/json")
    body = Dict("query" => query)
    response = HTTP.request("POST", client.url * "/sql", headers, body)
    return response
end