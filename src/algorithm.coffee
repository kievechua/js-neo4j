utils = require './utils.coffee'
request = require 'request'
Q = require 'q'

module.exports =
    # ###Find path
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-read-all-relationships)
    ```
    neo
    .findPath(1, {
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
    findPath: (nodeId, params) ->
        utils.post("#{@url}/db/data/node/#{nodeId}/paths", params)
