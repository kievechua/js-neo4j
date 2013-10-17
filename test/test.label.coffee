Q = require 'q'
chai = require 'chai'
chai.should()

{Neo4js} = require '../src/main'

describe 'Label', ->
    neo = new Neo4js()

    testNode = null

    before (done) ->
        neo.createNode({ name: 'Test label 1' })
        .then (node) ->
            testNode = node
            done()

    # Unable to run in after(), as it run before everything finish
    cleanup = ->
        Q.all([
            neo.deleteNode(testNode._id)
            neo.deleteNode(testNode._id)
        ])

    readNodeByLabel = ->
        describe 'readNodeByLabel', ->
            it 'should pass', (done) ->
                # Q.all([
                #     neo.readNodeByLabel('friend', { name: 'Test label 1' })
                # ])
                neo.readNodeByLabel('bestfriend')
                .then((result) ->
                    console.log result
                    # result.should.include 'friend'

                    readTypedLabel()
                    done()
                )
                .fail((result) ->
                    console.log result
                    # result.should.include 'friend'

                    readTypedLabel()
                    done()
                )

    readLabel = ->
        describe 'readLabel', ->
            it 'should pass', (done) ->
                Q.all([
                    neo.readLabel(testNode._id),
                    neo.readLabel()
                ])
                .then (result) ->
                    result[0].should.include 'bestfriend'

                    result[1].should.include 'bestfriend'
                    result[1].should.include 'friend'

                    readNodeByLabel()
                    done()

    updateLabel = ->
        describe 'updateLabel', ->
            it 'should pass', (done) ->
                neo.updateLabel(testNode._id, ['bestfriend'])
                .then((result) ->
                    result.should.be.true

                    readLabel()
                    done()
                )

    createLabel = ->
        describe 'createLabel', ->
            it 'should pass', (done) ->
                # Q.all([
                #     neo.createLabel(testNode._id, ['friend', 'colleague'])
                # ])
                neo.createLabel(testNode._id, 'friend')
                .then((result) ->
                    result.should.be.true
                    # result[1].should.be.true

                    updateLabel()
                    done()
                )

    createLabel()
