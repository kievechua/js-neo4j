utils = require './utils.coffee'
request = require 'request'
Q = require 'q'

Algorithm = require './algorithm'
Batch = require './batch'
Constraint = require './constraint'
Cypher = require './cypher'
Index = require './index'
Label = require './label'
Node = require './node'
Relationship = require './relationship'
Traversal = require './traversal'

class Neo4js extends utils.Module
    @include Algorithm
    @include Batch
    @include Constraint
    @include Cypher
    @include Index
    @include Label
    @include Node
    @include Relationship
    @include Traversal

    constructor: (url) ->
        if url
            @url = url
        else
            @url = 'http://localhost:7474'

    # ###Get service
    ###
    Without properties [Details](http://docs.neo4j.org/chunked/milestone/rest-api-nodes.html#rest-api-create-node)
    ```
    neo
    .service()
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    service: -> utils.get("#{@url}/db/data")

exports.version = '0.1.0'

exports.Neo4js = Neo4js

neo = new Neo4js()
# console.log neo
# neo.executeCypher('START root=node(*) RETURN root')
# .then((data) ->
#     console.log data
# )

neo
.queryBuilder()
.start(9)
.return(['to', 'type'])
.orderBy({
    to: 'asc'
})
.limit(3)
.toString()

neo
.queryBuilder()
.start('*')
.return('*')
.execute()
.fail((data) ->
    console.log 'error', arguments
)
.then((data) ->
    console.log data
)

neo
.queryBuilder()
.direction('n=a/tr=love/n')
.toString()
