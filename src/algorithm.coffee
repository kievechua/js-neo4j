utils = require './utils.coffee'
request = require 'request'
Q = require 'q'

module.exports =
    # ###Find path
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-get-all-relationships)
    ```
    neo
    .getRelationships(1, {
        "to" : "http://localhost:7474/db/data/node/43",
        "max_depth" : 3,
        "relationships" : {
            "type" : "to",
            "direction" : "out"
        },
        "algorithm" : "shortestPath"
    })
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    findPath: (nodeId, params) ->
        utils.post("#{@url}/db/data/node/#{nodeId}/paths", json: params)
