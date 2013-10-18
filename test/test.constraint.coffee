Q = require 'q'
chai = require 'chai'
chai.should()

{Neo4js} = require '../src/main'

describe 'Constraint', ->
    neo = new Neo4js()

    randomProperty = null
    # testNode = null

    # before (done) ->
    #     Q.all([
    #         neo.createNode({ name: 'Test batch 1' })
    #         neo.createNode({ name: 'Test batch 2' })
    #     ])
    #     .then (result) ->
    #         testNode = result
    #         done()

    deleteConstraint = ->
        describe 'deleteConstraint', ->
            it 'should pass', (done) ->
                neo.deleteConstraint('person', randomProperty)
                .then((result) ->
                    result.should.be.true

                    done()
                )
                .fail((result) ->
                    console.log result

                    done()
                )

    readUniquenessConstraint = ->
        defer = Q.defer()

        describe 'readUniquenessConstraint', ->
            it 'should pass', (done) ->
                neo
                .readUniquenessConstraint('person', randomProperty)
                .then((result) ->
                    result[0]['property-keys'][0].should.equal randomProperty

                    defer.resolve(true)
                    done()
                )
                .fail((result) ->
                    console.log result

                    defer.resolve(false)
                    done()
                )

        defer.promise

    readConstraint = ->
        defer = Q.defer()

        describe 'readConstraint', ->
            it 'should pass', (done) ->
                neo
                .readConstraint()
                .then((result) ->
                    result.should.have.length.of.at.least 1

                    defer.resolve(true)
                    done()
                )

        defer.promise

    describe 'createUniquenessConstraint', ->
        it 'should pass', (done) ->
            randomProperty = 'name' + (Math.random() * (10000000 - 1) + 1)

            neo.createUniquenessConstraint('person', [randomProperty])
            .then((result) ->
                result.should.be.true

                Q.all([
                    readConstraint()
                    readUniquenessConstraint()
                ])
                .then (result) ->
                    deleteConstraint()

                done()
            )
            .fail((result) ->
                console.log randomProperty

                readConstraint()
                readUniquenessConstraint()
                done()
            )
