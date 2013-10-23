utils = require './utils'

Algorithm = require './algorithm'
Batch = require './batch'
Constraint = require './constraint'
Cypher = require './cypher'
Index = require './indexing'
Label = require './label'
Node = require './node'
Relationship = require './relationship'
Traversal = require './traversal'

#  Register coffee-coverage if coverage is enabled.
# if process.env.COVERAGE
require('coffee-coverage').register({
    path: 'abbr',
    basePath: __dirname,
    exclude: ['/test', '/node_modules', '/.git'],
    initAll: true
})

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

    # ###read service
    ###
    Without properties [Details](http://docs.neo4j.org/chunked/milestone/rest-api-nodes.html#rest-api-create-node)
    ```
    neo.service()
    ```
    ###
    service: -> utils.get("#{@url}/db/data", (result) -> result.body)

    utils: utils

exports.Neo4js = Neo4js
