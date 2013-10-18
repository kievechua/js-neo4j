chai = require 'chai'
chai.should()

{Neo4js} = require '../src/main'

describe 'Index', ->
    neo = new Neo4js()

    deleteIndex = ->
        describe 'deleteIndex', ->
            it 'should pass', (done) ->
                neo
                .deleteIndex('testuser', 'name')
                .then((result) ->
                    result.should.be.true

                    done()
                )

    readIndex = ->
        describe 'readIndex', ->
            it 'should pass', (done) ->
                neo
                .readIndex('testuser')
                .then((result) ->
                    result[0].label.should.equal 'testuser'
                    result[0]['property-keys'].should.include 'name'

                    deleteIndex()

                    done()
                )

    describe 'createIndex', ->
        it 'should pass', (done) ->
            neo
            .createIndex('testuser', ['name'])
            .then((result) ->
                result.label.should.equal 'testuser'
                result['property-keys'].should.include 'name'

                readIndex()

                done()
            )
