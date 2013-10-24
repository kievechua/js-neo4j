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

    describe 'neo.createUniquenessConstraint(label, [property])', ->
        describe 'when valid', ->
            it 'should return true', ->
                neo
                .createUniquenessConstraint('person', [randomProperty])
                .then((result) ->
                    result.should.be.true
                )
                .fail((result) ->
                    console.log randomProperty
                )
        describe 'when invalid', ->
            it 'should throw error message', ->
                (-> neo.createUniquenessConstraint()).should.throw Error
                (-> neo.createUniquenessConstraint(1)).should.throw Error
                (-> neo.createUniquenessConstraint(1, 'some')).should.throw Error
                (-> neo.createUniquenessConstraint('testperson', {})).should.throw Error

    describe 'neo.readConstraint()', ->
        describe 'when valid', ->
            it 'should return all constraint', ->
                neo
                .readConstraint()
                .should.eventually.have.length.of.at.least 1
        describe 'when invalid', ->
            it 'should throw error message', ->
                (-> neo.readConstraint(1)).should.throw Error

    describe 'neo.readUniquenessConstraint(label, property)', ->
        describe 'when valid', ->
            it 'should return node with specified label and constraint', ->
                neo
                .readUniquenessConstraint('person', randomProperty)
                .then((result) ->
                    result[0]['property-keys'][0].should.equal randomProperty
                )
        describe 'when invalid', ->
            it 'should throw error message', ->
                (-> neo.readUniquenessConstraint()).should.throw Error
                (-> neo.readUniquenessConstraint(1)).should.throw Error
                (-> neo.readUniquenessConstraint(1, 'some')).should.throw Error
                (-> neo.readUniquenessConstraint('testperson', {})).should.throw Error

    describe 'neo.deleteConstraint(label, property)', ->
        describe 'when valid', ->
            it 'should return true', ->
                neo
                .deleteConstraint('person', randomProperty)
                .should.eventually.be.true
        describe 'when invalid', ->
            it 'should throw error message', ->
                (-> neo.deleteConstraint()).should.throw Error
                (-> neo.deleteConstraint(1)).should.throw Error
                (-> neo.deleteConstraint('some', 1)).should.throw Error
