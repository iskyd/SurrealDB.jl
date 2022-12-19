using HTTP
using Base64
using JSON

export HTTPClient, execute, select, create_record, update_record, delete_record, delete_all

struct HTTPClient
    url::String
    namespace::String
    database::String
    username::String
    password::String
end

function HTTPClient(url::String, namespace::String, database::String, username::String, password::String)::HTTPClient
    return HTTPClient(url, namespace, database, username, password)
end

function HTTPClient(url::String, namespace::String, database::String)::HTTPClient
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
    response = HTTP.post(client.url * "/sql", headers, query)
    if response.status != 200
        error("Error executing query: " * String(response.body))
    end

    return JSON.parse(String(response.body))[1]["result"]
end

function select(client::HTTPClient, table::String, key::String="")
    headers = Dict(
        "Content-Type" => "text/plain",
        "Accept" => "application/json",
        "NS" => "test",
        "DB" => "test",
        "Authorization" => "Basic " * base64encode(client.username * ":" * client.password),
    )
    url = client.url * "/key/" * table
    if key !== ""
        url = url * "/" * key
    end

    response = HTTP.get(url, headers)
    if response.status != 200
        error("Error executing query: " * String(response.body))
    end

    return JSON.parse(String(response.body))[1]["result"]
end

function create_record(client::HTTPClient, table::String, object::Dict, key::String="")
    headers = Dict(
        "Content-Type" => "text/plain",
        "Accept" => "application/json",
        "NS" => "test",
        "DB" => "test",
        "Authorization" => "Basic " * base64encode(client.username * ":" * client.password),
    )
    url = client.url * "/key/" * table
    if key !== ""
        url = url * "/" * key
    end
    
    response = HTTP.post(url, headers, JSON.json(object))
    if response.status != 200
        error("Error executing query: " * String(response.body))
    end

    return true
end

function update_record(client::HTTPClient, table::String, key::String, object::Dict, patch::Bool=true)
    headers = Dict(
        "Content-Type" => "text/plain",
        "Accept" => "application/json",
        "NS" => "test",
        "DB" => "test",
        "Authorization" => "Basic " * base64encode(client.username * ":" * client.password),
    )

    url = client.url * "/key/" * table * "/" * key
    if patch
        response = HTTP.patch(url, headers, JSON.json(object))
    else
        response = HTTP.put(url, headers, JSON.json(object))
    end

    if response.status != 200
        error("Error executing query: " * String(response.body))
    end

    return true
end

function delete_record(client::HTTPClient, table::String, key::String)
    headers = Dict(
        "Content-Type" => "text/plain",
        "Accept" => "application/json",
        "NS" => "test",
        "DB" => "test",
        "Authorization" => "Basic " * base64encode(client.username * ":" * client.password),
    )
    response = HTTP.delete(client.url * "/key/" * table * "/" * key, headers)
    if response.status != 200
        error("Error executing query: " * String(response.body))
    end

    return true
end

function delete_all(client::HTTPClient, table::String)
    headers = Dict(
        "Content-Type" => "text/plain",
        "Accept" => "application/json",
        "NS" => "test",
        "DB" => "test",
        "Authorization" => "Basic " * base64encode(client.username * ":" * client.password),
    )
    response = HTTP.delete(client.url * "/key/" * table, headers)
    if response.status != 200
        error("Error executing query: " * String(response.body))
    end

    return true
end