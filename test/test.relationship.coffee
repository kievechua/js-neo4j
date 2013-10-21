Q = require 'q'
chai = require 'chai'
chaiAsPromised = require 'chai-as-promised'

chai.should()
chai.use(chaiAsPromised)

require("mocha-as-promised")()

{Neo4js} = require '../src/main'

describe 'Relationship', ->
    neo = new Neo4js()

    testNode = null
    testRelationship = null

    before (done) ->
        Q.all([
            neo.createNode({ name: 'Test relationship 1' })
            neo.createNode({ name: 'Test relationship 2' })
        ])
        .then (result) ->
            testNode = result

            done()

    describe 'createRelationship', ->
        it 'should pass', ->
            neo
            .createRelationship(
                testNode[0]._id,
                testNode[1]._id,
                'friend',
                { since: '10 years ago' }
            )
            .then((relationship) ->
                testRelationship = relationship

                relationship.since.should.equal '10 years ago'
            )

    describe 'readRelationship', ->
        it 'should pass', ->
            neo
            .readRelationship(testRelationship._id)
            .then((result) ->
                result.since.should.equal '10 years ago'
            )

    describe 'updateRelationshipProperty', ->
        it 'should pass', ->
            neo
            .updateRelationshipProperty(testRelationship._id, 'since', '11 years ago')
            .then((result) ->
                result.should.be.true
            )

        it 'should pass', ->
            neo
            .updateRelationshipProperty(testRelationship._id, { 'since': '12 years ago', 'sinceAge': 17 })
            .then((result) ->
                result.should.be.true
            )

    describe 'readRelationshipProperty', ->
        it 'should pass', ->
            neo
            .readRelationshipProperty(testRelationship._id)
            .then((result) ->
                result.since.should.equal '12 years ago'
                result.sinceAge.should.equal 17
            )

    describe 'readRelationshipType', ->
        it 'should pass', ->
            neo
            .readRelationshipType()
            .then (result) ->
                result.should.include 'friend'

    describe 'readTypedRelationship', ->
        it 'should pass', ->
            Q.all([
                neo.readTypedRelationship(testNode[1]._id, 'all')
                neo.readTypedRelationship(testNode[1]._id, 'in')
                neo.readTypedRelationship(testNode[1]._id, 'out')
                neo.readTypedRelationship(testNode[1]._id, 'all', 'friend')
                neo.readTypedRelationship(testNode[1]._id, 'in', 'friend')
                neo.readTypedRelationship(testNode[1]._id, 'out', 'friend')
                neo.readTypedRelationship(testNode[1]._id, 'all', ['friend', 'lover'])
            ])
            .then((result) ->
                result[0].should.have.length 1
                result[1].should.have.length 1
                result[2].should.be.empty
                result[3].should.have.length 1
                result[4].should.have.length 1
                result[5].should.be.empty
                result[6].should.have.length 1
            )

    describe 'deleteRelationshipProperty', ->
        describe 'delete with property', ->
            it 'should pass', ->
                neo
                .deleteRelationshipProperty(testRelationship._id, 'since')
                .should.eventually.be.true

        describe 'delete without property', ->
            it 'should pass', ->
                neo
                .deleteRelationshipProperty(testRelationship._id)
                .should.eventually.be.true

    describe 'deleteRelationship', ->
        it 'should pass', ->
            neo
            .deleteRelationship(testRelationship._id)
            .should.eventually.be.true

    after ->
        Q.all([
            neo.deleteNode(testNode[0]._id)
            neo.deleteNode(testNode[1]._id)
        ])
