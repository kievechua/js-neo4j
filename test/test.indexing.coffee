Q = require 'q'
chai = require 'chai'
chai.should()

{Neo4js} = require '../src/main'

describe 'Index', ->
    neo = new Neo4js()

    deleteIndex = ->
        describe 'deleteIndex', ->
            it 'should pass', (done) ->
                neo
                .deleteIndex('user', 'name')
                .then((result) ->
                    result.should.be.true

                    done()
                )

    readIndex = ->
        describe 'readIndex', ->
            it 'should pass', (done) ->
                neo
                .readIndex('user')
                .then((result) ->
                    result[0].label.should.equal 'user'
                    result[0]['property-keys'].should.include 'name'

                    deleteIndex()

                    done()
                )

    describe 'createIndex', ->
        it 'should pass', (done) ->
            randomProperty = 'name' + (Math.random() * (10000000 - 1) + 1)

            neo
            .createIndex('user', ['name'])
            .then((result) ->
                result.label.should.equal 'user'
                result['property-keys'].should.include 'name'

                readIndex()

                done()
            )
            .fail((result) ->
                readIndex()

                done()
            )
