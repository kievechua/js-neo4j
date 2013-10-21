chai = require 'chai'
chaiAsPromised = require 'chai-as-promised'

chai.should()
chai.use(chaiAsPromised)

require("mocha-as-promised")()

{Neo4js} = require '../src/main'

describe 'Index', ->
    neo = new Neo4js()

    describe 'createIndex', ->
        it 'should pass', ->
            neo
            .createIndex('testuser', ['name'])
            .then((result) ->
                result.label.should.equal 'testuser'
                result['property-keys'].should.include 'name'
            )

    describe 'readIndex', ->
        it 'should pass', ->
            neo
            .readIndex('testuser')
            .then((result) ->
                result[0].label.should.equal 'testuser'
                result[0]['property-keys'].should.include 'name'
            )

    describe 'deleteIndex', ->
        it 'should pass', ->
            neo
            .deleteIndex('testuser', 'name')
            .should.eventually.be.true
