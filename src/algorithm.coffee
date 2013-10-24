utils = require './utils'
request = require 'request'
Q = require 'q'
_ = require 'lodash'

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
        if _.isEmpty nodeId then throw new Error 'Node id cannot be empty'
        if _.isEmpty params then throw new Error 'Params cannot be empty'

        utils.post(
            "#{@url}/db/data/node/#{nodeId}/paths"
            params
            (result) -> result.body
        )
