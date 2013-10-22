Q = require 'q'
chai = require 'chai'
chaiAsPromised = require 'chai-as-promised'

chai.should()
chai.use(chaiAsPromised)

require("mocha-as-promised")()

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

    describe 'neo.executeBatch([tasks])', ->
        describe 'when valid', ->
            it 'should return all task result', ->
                neo
                .executeBatch([{
                    "method" : "GET",
                    "to" : "/node/#{testNode[0]._id}",
                    "id" : parseInt(testNode[0]._id)
                }, {
                    "method" : "GET",
                    "to" : "/node/#{testNode[1]._id}",
                    "id" : parseInt(testNode[1]._id)
                }])
                .then((result) ->
                    result[0].id.should.equal parseInt(testNode[0]._id)
                    result[1].id.should.equal parseInt(testNode[1]._id)
                )

    after ->
        Q.all([
            neo.deleteNode(testNode[0]._id)
            neo.deleteNode(testNode[1]._id)
        ])
