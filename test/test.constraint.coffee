Q = require 'q'
chai = require 'chai'
chai.should()

{Neo4js} = require '../src/main'

describe 'Constraint', ->
    neo = new Neo4js()

    # testNode = null

    # before (done) ->
    #     Q.all([
    #         neo.createNode({ name: 'Test batch 1' })
    #         neo.createNode({ name: 'Test batch 2' })
    #     ])
    #     .then (result) ->
    #         testNode = result
    #         done()

    readUniquenessConstraint = ->
        describe 'readUniquenessConstraint', ->
            it 'should pass', (done) ->
                neo
                .readUniquenessConstraint('person', 'name')
                .then((result) ->
                    result.should.be.true

                    done()
                )
                .fail((result) ->
                    console.log randomProperty

                    done()
                )


    describe 'createUniquenessConstraint', ->
        it 'should pass', (done) ->
            randomProperty = 'name' + (Math.random() * (10000000 - 1) + 1)

            neo.createUniquenessConstraint('person', [randomProperty])
            .then((result) ->
                result.should.be.true

                readUniquenessConstraint()
                done()
            )
            .fail((result) ->
                console.log randomProperty

                readUniquenessConstraint()
                done()
            )
