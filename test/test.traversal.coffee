Q = require 'q'
chai = require 'chai'
chaiAsPromised = require 'chai-as-promised'

chai.should()
chai.use(chaiAsPromised)

require("mocha-as-promised")()

{Neo4js} = require '../src/main'

describe 'Traversal', ->
    neo = new Neo4js()

    testNode = null
    testRelationship = null

    before (done) ->
        Q.all([
            neo.createNode({ name: 'Test traversal 1' })
            neo.createNode({ name: 'Test traversal 2' })
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

    describe 'createPagedTraverse', ->
        it 'should pass', ->
            neo
            .createPagedTraverse(testNode[0]._id, {
                "prune_evaluator" : {
                    "language" : "builtin",
                    "name" : "none"
                },
                "return_filter" : {
                    "language" : "javascript",
                    "body" : "position.endNode().getProperty('name').contains('Test traversal 1');"
                },
                "order" : "depth_first",
                "relationships" : {
                    "type" : "testfriend",
                    "direction" : "out"
                }
            })
            .then((result) ->
                result.length.should.equal 1
            )

    describe 'traversePath', ->
        it 'should pass', ->
            neo.traversePath(testNode[0]._id, {
                "order" : "breadth_first",
                "uniqueness" : "none",
                "return_filter" : {
                    "language" : "builtin",
                    "name" : "all"
                }
            })
            .then((result) ->
                result.length.should.equal 1
            )

    describe 'traverseNode', ->
        it 'should pass', ->
            neo.traverseNode(testNode[0]._id, {
                "order" : "breadth_first",
                "uniqueness" : "none",
                "return_filter" : {
                    "language" : "builtin",
                    "name" : "all"
                }
            }).then((result) ->
                result.length.should.equal 1
            )

    describe 'pagedTraverse', ->
        it 'should pass', ->
            neo
            .pagedTraverse(testNode[0]._id, { pageSize: 1 })
            .then((result) ->
                result.length.should.equal 1
            )

    after (done) ->
        neo
        .deleteRelationship(testRelationship._id)
        .then(->
            Q.all([
                neo.deleteNode(testNode[0]._id)
                neo.deleteNode(testNode[1]._id)
            ])
            .then(-> done())
        )
