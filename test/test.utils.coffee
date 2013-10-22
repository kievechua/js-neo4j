Q = require 'q'
chai = require 'chai'
chaiAsPromised = require 'chai-as-promised'

chai.should()
chai.use(chaiAsPromised)

require("mocha-as-promised")()

{Neo4js} = require '../src/main'

describe 'Utils', ->
    utils = new Neo4js().utils

    describe 'objToStr', ->
        it 'should return stringify object', ->
            utils.objToStr(name: 'kieve', age: 18).should.equal "{ name : 'kieve', age : '18' }"
