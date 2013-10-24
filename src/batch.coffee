utils = require './utils'
_ = require 'lodash'

module.exports =
    # ###Execute batch operation
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-read-all-relationships)
    ```
    neo
    .executeBatch([
        {
          "method" : "PUT",
          "to" : "/node/221/properties",
          "body" : {
            "age" : 1
          },
          "id" : 0
        }, {
          "method" : "GET",
          "to" : "/node/221",
          "id" : 1
        }, {
          "method" : "POST",
          "to" : "/node",
          "body" : {
            "age" : 1
          },
          "id" : 2
        }, {
          "method" : "POST",
          "to" : "/node",
          "body" : {
            "age" : 1
          },
          "id" : 3
        }
    ])
    ```
    ###
    executeBatch: (params) ->
        if _.isEmpty params then throw new Error 'Params cannot be empty'

        utils.post("#{@url}/db/data/batch", params, (result) -> result.body)

    # # ###Execute multiple operations in batch streaming
    # ###
    # TODO
    # [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-read-all-relationships)
    # ```
    # neo
    # .executeBatchStream(1, {
    #     "to" : "http://localhost:7474/db/data/node/43",
    #     "max_depth" : 3,
    #     "relationships" : {
    #         "type" : "to",
    #         "direction" : "out"
    #     },
    #     "algorithm" : "shortestPath"
    # })
    # ```
    # ###
    # executeBatchStream: (params) ->
    #     utils.post("#{@url}/db/data/batch", params)
