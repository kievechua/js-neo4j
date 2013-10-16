utils = require './utils.coffee'

module.exports =
    # ###Execute batch operation
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-read-all-relationships)
    ```
    neo
    .executeBatch(1, {
        "to" : "http://localhost:7474/db/data/node/43",
        "max_depth" : 3,
        "relationships" : {
            "type" : "to",
            "direction" : "out"
        },
        "algorithm" : "shortestPath"
    })
    ```
    ###
    executeBatch: (params) ->
        utils.post("#{@url}/db/data/batch", json: params)

    # ###Execute multiple operations in batch streaming
    ###
    TODO
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-read-all-relationships)
    ```
    neo
    .executeBatchStream(1, {
        "to" : "http://localhost:7474/db/data/node/43",
        "max_depth" : 3,
        "relationships" : {
            "type" : "to",
            "direction" : "out"
        },
        "algorithm" : "shortestPath"
    })
    ```
    ###
    executeBatchStream: (params) ->
        utils.post("#{@url}/db/data/batch", json: params)
