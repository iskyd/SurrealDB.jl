using HTTP
using Base64
using JSON

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
    headers = Dict(
        "Content-Type" => "text/plain", 
        "Accept" => "application/json", 
        "NS" => "test", 
        "DB" => "test",
        "Authorization" => "Basic " * base64encode(client.username * ":" * client.password),
    )
    response = HTTP.post(client.url, headers, query)
    if response.status != 200
        error("Error executing query: " * String(response.body))
    end

    return JSON.parse(String(response.body))[1]["result"]
end