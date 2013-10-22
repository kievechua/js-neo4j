chai = require 'chai'
chaiAsPromised = require 'chai-as-promised'

chai.should()
chai.use(chaiAsPromised)

require("mocha-as-promised")()

{Neo4js} = require '../src/main'

describe 'Index', ->
    neo = new Neo4js()

    describe 'neo.createIndex(label, [property])', ->
        describe 'when valid', ->
            it 'should create an index', ->
                neo
                .createIndex('testuser', ['name'])
                .then((result) ->
                    result.label.should.equal 'testuser'
                    result['property-keys'].should.include 'name'
                )

    describe 'neo.readIndex(label)', ->
        describe 'when valid', ->
            it 'should return nodes under specified label', ->
                neo
                .readIndex('testuser')
                .then((result) ->
                    result[0].label.should.equal 'testuser'
                    result[0]['property-keys'].should.include 'name'
                )

    describe 'neo.deleteIndex(label, property)', ->
        describe 'when valid', ->
            it 'should drop index', ->
                neo
                .deleteIndex('testuser', 'name')
                .should.eventually.be.true
