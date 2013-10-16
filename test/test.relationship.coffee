Q = require 'q'
chai = require 'chai'
chai.should()

{Neo4js} = require '../src/main'

describe 'Cypher', ->
    neo = new Neo4js()

    testNode = null

    before (done) ->
        Q.all([
            neo.createNode({ name: 'Test relationship 1' })
            neo.createNode({ name: 'Test relationship 2' })
        ])
        .then (result) ->
            testNode = result
            done()

    after (done) ->
        Q.all([
            neo.deleteNode(testNode[0]._id)
            neo.deleteNode(testNode[1]._id)
        ])
        .then((result) ->
            done()
        )

        done()

    deleteRelationship = (relationship) ->
        describe 'deleteRelationship', ->
            it 'should pass', (done) ->
                neo.deleteRelationship(relationship._id).then((result) ->
                    result.should.be.true
                    done()
                )

    deleteRelationshipProperty = (relationship) ->
        describe 'deleteRelationshipProperty', ->
            it 'should pass', (done) ->
                Q.all([
                    neo.deleteRelationshipProperty(relationship._id, 'age')
                    neo.deleteRelationshipProperty(relationship._id)
                ])
                .then (result) ->
                    result[0].should.be.true
                    result[1].should.be.true

                    deleteRelationship(relationship)
                    done()

    readRelationshipProperty = (relationship) ->
        describe 'readRelationshipProperty', ->
            it 'should pass', (done) ->
                neo.readRelationshipProperty(relationship._id)
                .then (result) ->
                    result.name.should.equal 'Kieve Chua'
                    result.age.should.equal 17

                    deleteRelationshipProperty(relationship)
                    done()

    updateRelationshipProperty = (relationship) ->
        describe 'updateRelationshipProperty', ->
            it 'should pass', (done) ->
                Q.all([
                    neo.updateRelationshipProperty(relationship._id, 'gender', 'male')
                    neo.updateRelationshipProperty(relationship._id, { 'name': 'Kieve Chua', 'age': 17 })
                ])
                .then (result) ->
                    result[0].should.be.true
                    result[1].should.be.true

                    readRelationshipProperty(relationship)
                    done()

    readRelationship = (relationship) ->
        describe 'readRelationship', ->
            it 'should pass', (done) ->
                console.log testNode[0]._id
                neo.readRelationship(testNode[0]._id).then((result) ->
                    console.log result
                    # result.name.should.equal 'Kieve'

                    # updateRelationshipProperty(relationship)
                    done()
                )

    createRelationship = ->
        describe 'createRelationship', ->
            it 'should pass', (done) ->
                neo.createRelationship(testNode[0]._id, testNode[1]._id, 'friend', { since: '10 years ago' }).then((relationship) ->
                    relationship.since.should.equal '10 years ago'

                    readRelationship(relationship)
                    done()
                )

    createRelationship()
