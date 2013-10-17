Q = require 'q'
chai = require 'chai'
chai.should()

{Neo4js} = require '../src/main'

describe 'Traversal', ->
    neo = new Neo4js()

    testNode = null

    before (done) ->
        Q.all([
            neo.createNode({ name: 'Test traversal 1' })
            neo.createNode({ name: 'Test traversal 2' })
        ])
        .then (result) ->
            testNode = result
            done()

    # TODO
    pagedTraverse = ->
        describe 'pagedTraverse', ->
            it 'should pass', (done) ->
                neo
                .pagedTraverse(testNode[0]._id, '411')
                .then((result) ->
                    console.log result
                    # result.length.should.equal 1

                    done()
                )
                .fail((result) ->
                    console.log result
                    # result.length.should.equal 1

                    done()
                )

    describe 'createPagedTraverse', ->
        it 'should pass', (done) ->
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
                    "type" : "NEXT",
                    "direction" : "out"
                }
            })
            .then((result) ->
                result.length.should.equal 1

                # pagedTraverse()

                done()
            )

    describe 'traversePath', ->
        it 'should pass', (done) ->
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

                done()
            )

    describe 'traverseNode', ->
        it 'should pass', (done) ->
            neo.traverseNode(testNode[0]._id, {
                "order" : "breadth_first",
                "uniqueness" : "none",
                "return_filter" : {
                    "language" : "builtin",
                    "name" : "all"
                }
            }).then((result) ->
                result.length.should.equal 1

                done()
            )
