Q = require 'q'
chai = require 'chai'
chai.should()

{Neo4js} = require '../src/main'

describe 'Algorithm', ->
    neo = new Neo4js()

    testNode = null
    testRelationship = null

    before (done) ->
        Q.all([
            neo.createNode({ name: 'Test algorithm 1' })
            neo.createNode({ name: 'Test algorithm 2' })
        ])
        .then (result) ->
            testNode = result

            neo
            .createRelationship(
                testNode[0]._id,
                testNode[1]._id,
                'testfriend',
                { since: '10 years ago' }
            )
            .then((relationship) ->
                testRelationship = relationship

                done()
            )

    after (done) ->
        neo
        .deleteRelationship(testRelationship._id)
        .then((relationship) ->
            Q.all([
                neo.deleteNode(testNode[0]._id)
                neo.deleteNode(testNode[1]._id)
            ])
            .then((result) ->
                done()
            )
        )

    describe 'createIndex', ->
        it 'should pass', (done) ->
            neo
            .findPath(testNode[0]._id, {
                "to" : "http://localhost:7474/db/data/node/#{testNode[1]._id}",
                "max_depth" : 3,
                "relationships" : {
                    "type" : "testfriend",
                    "direction" : "out"
                },
                "algorithm" : "shortestPath"
            })
            .then((result) ->
                result[0].start.should.equal "http://localhost:7474/db/data/node/#{testNode[0]._id}"
                result[0].end.should.equal "http://localhost:7474/db/data/node/#{testNode[1]._id}"

                done()
            )
            .fail((result) ->

                done()
            )