Q = require 'q'
chai = require 'chai'
chai.should()

{Neo4js} = require '../src/main'

describe 'Batch', ->
    neo = new Neo4js()

    testNode = null

    before (done) ->
        Q.all([
            neo.createNode({ name: 'Test batch 1' })
            neo.createNode({ name: 'Test batch 2' })
        ])
        .then (result) ->
            testNode = result
            done()

    describe 'executeBatch', ->
        it 'should pass', (done) ->
            neo
                .executeBatch([{
                    "method" : "PUT",
                    "to" : "/node/#{testNode[0]._id}/properties",
                    "body" : {
                        "age" : 1
                    },
                    "id" : 4
                }, {
                    "method" : "GET",
                    "to" : "/node/#{testNode[0]._id}",
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
                }])
                .then((result) ->
                    result[0].id.should.equal 4
                    result[1].id.should.equal 1
                    result[2].id.should.equal 2
                    result[3].id.should.equal 3

                    done()
                )
