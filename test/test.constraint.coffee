Q = require 'q'
chai = require 'chai'
chaiAsPromised = require 'chai-as-promised'

chai.should()
chai.use(chaiAsPromised)

require("mocha-as-promised")()

{Neo4js} = require '../src/main'

describe 'Constraint', ->
    neo = new Neo4js()

    randomProperty = 'name' + (Math.random() * (10000000 - 1) + 1)

    describe 'createUniquenessConstraint', ->
        it 'should pass', ->
            neo
            .createUniquenessConstraint('person', [randomProperty])
            .then((result) ->
                result.should.be.true
            )
            .fail((result) ->
                console.log randomProperty
            )

    describe 'readConstraint', ->
        it 'should pass', ->
            neo
            .readConstraint()
            .should.eventually.have.length.of.at.least 1

    describe 'readUniquenessConstraint', ->
        it 'should pass', ->
            neo
            .readUniquenessConstraint('person', randomProperty)
            .then((result) ->
                result[0]['property-keys'][0].should.equal randomProperty
            )

    describe 'deleteConstraint', ->
        it 'should pass', ->
            neo
            .deleteConstraint('person', randomProperty)
            .should.eventually.be.true
