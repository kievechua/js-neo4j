Q = require 'q'
chai = require 'chai'
chaiAsPromised = require 'chai-as-promised'

chai.should()
chai.use(chaiAsPromised)

require("mocha-as-promised")()

{Neo4js} = require '../src/main'

describe 'Utils', ->
    utils = new Neo4js().utils

    describe 'neo.objToStr({object})', ->
        describe 'when valid', ->
            it 'should return stringified object', ->
                utils.objToStr(name: 'kieve', age: 18).should.equal "{ name : 'kieve', age : '18' }"

    describe 'neo.get(url)', ->
        describe 'when valid', ->
            it 'should return stringified object', ->
                utils
                .get('http://localhost:7474/db/data')
                .then((result) ->
                    result.ok.should.be.true
                )
