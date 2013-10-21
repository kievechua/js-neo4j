_ = require 'lodash'
utils = require './utils'

module.exports =
    # ###Traversal using a return filter
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-post-all-relationships)
    ```
    neo
    .traverseNode(1, {
        "order" : "breadth_first",
        "return_filter" : {
            "body" : "position.endNode().postProperty('name').toLowerCase().contains('t')",
            "language" : "javascript"
        },
        "prune_evaluator" : {
            "body" : "position.length() > 10",
            "language" : "javascript"
        },
        "uniqueness" : "node_global",
        "relationships" : [ {
            "direction" : "all",
            "type" : "knows"
        }, {
            "direction" : "all",
            "type" : "loves"
        } ],
        "max_depth" : 3
    })
    ```
    ###
    traverseRelationship: (nodeId, params) ->
        utils.post("#{@url}/db/data/node/#{nodeId}/traverse/relationship", params)

    # ###Return relationships from a traversal
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-traverse.html#rest-api-return-relationships-from-a-traversal)
    ```
    neo
    .traverseNode(1, {
        "order" : "breadth_first",
        "uniqueness" : "none",
        "return_filter" : {
            "language" : "builtin",
            "name" : "all"
        }
    })
    ```
    ###
    traverseNode: (nodeId, params) ->
        utils.post("#{@url}/db/data/node/#{nodeId}/traverse/node", params, (result) -> result.body)

    # ###Return paths from a traversal
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-traverse.html#rest-api-return-paths-from-a-traversal)
    ```
    neo
    .traversePath(1, {
        "order" : "breadth_first",
        "uniqueness" : "none",
        "return_filter" : {
            "language" : "builtin",
            "name" : "all"
        }
    })
    ```
    ###
    traversePath: (nodeId, params) ->
        utils.post("#{@url}/db/data/node/#{nodeId}/traverse/path", params, (result) -> result.body)

    # ###Creating a paged traverser
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-traverse.html#rest-api-creating-a-paged-traverser)
    ```
    neo
    .createPagedTraverse(1, {
        "prune_evaluator" : {
            "language" : "builtin",
            "name" : "none"
        },
        "return_filter" : {
            "language" : "javascript",
            "body" : "position.endNode().readProperty('name').contains('1');"
        },
        "order" : "depth_first",
        "relationships" : {
            "type" : "NEXT",
            "direction" : "out"
        }
    })
    ```
    ###
    createPagedTraverse: createPagedTraverse = (nodeId, params) ->
        utils.post(
            "#{@url}/db/data/node/#{nodeId}/traverse/node",
            params,
            (result) -> result.body
        )
    cPagedTraverse: createPagedTraverse

    # ###Paging through the results of a paged traverser
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-traverse.html#rest-api-paging-through-the-results-of-a-paged-traverser)
    ```
    neo.pagedTraverse(1, '54ff662853e84dbcbabba3930e0a8fce')
    ```
    ```
    neo.pagedTraverse(1, { pageSize: 1 })
    ```
    ```
    neo.pagedTraverse(1, { leaseTime: 10 })
    ```
    ###
    pagedTraverse: (nodeId, params) ->
        if _.isString params
            utils.get("#{@url}/db/data/node/#{nodeId}/paged/traverse/node/#{params}")
        else if _.isObject params
            utils.post(
                "#{@url}/db/data/node/#{nodeId}/paged/traverse/node",
                params,
                (result) -> result.body
            )
