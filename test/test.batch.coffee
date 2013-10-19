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

    after ->
        Q.all([
            neo.deleteNode(testNode[0]._id)
            neo.deleteNode(testNode[1]._id)
            neo.deleteNode(9999999)
        ])

    describe 'executeBatch', ->
        it 'should pass', (done) ->
            neo
            .executeBatch([{
                "method" : "PUT",
                "to" : "/node/#{testNode[0]._id}/properties",
                "body" : {
                    "age" : 1
                },
                "id" : parseInt(testNode[0]._id)
            }, {
                "method" : "GET",
                "to" : "/node/#{testNode[0]._id}",
                "id" : parseInt(testNode[0]._id)
            }, {
                "method" : "POST",
                "to" : "/node",
                "body" : {
                    "age" : 1
                },
                "id" : 9999999
            }])
            .then((result) ->
                result[0].id.should.equal parseInt(testNode[0]._id)
                result[1].id.should.equal parseInt(testNode[0]._id)
                result[2].id.should.equal parseInt(9999999)

                done()
            )
