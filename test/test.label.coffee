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
            neo.deleteNode(testNode[0]._id)
            neo.deleteNode(testNode[1]._id)
        ])

    deleteLabel = (label) ->
        describe 'deleteLabel', ->
            it 'should pass', (done) ->
                neo.deleteLabel(label._id).then((result) ->
                    result.should.be.true

                    cleanup()

                    done()
                )

    deleteLabelProperty = (label) ->
        describe 'deleteLabelProperty', ->
            it 'should pass', (done) ->
                Q.all([
                    neo.deleteLabelProperty(label._id, 'since')
                    neo.deleteLabelProperty(label._id)
                ])
                .then (result) ->
                    result[0].should.be.true
                    result[1].should.be.true

                    deleteLabel(label)
                    done()

    readTypedLabel = (label) ->
        describe 'readTypedLabel', ->
            it 'should pass', (done) ->
                Q.all([
                    neo.readTypedLabel(testNode[1]._id, 'all')
                    neo.readTypedLabel(testNode[1]._id, 'in')
                    neo.readTypedLabel(testNode[1]._id, 'out')
                    neo.readTypedLabel(testNode[1]._id, 'all', 'friend')
                    neo.readTypedLabel(testNode[1]._id, 'in', 'friend')
                    neo.readTypedLabel(testNode[1]._id, 'out', 'friend')
                    neo.readTypedLabel(testNode[1]._id, 'all', ['friend', 'lover'])
                    # neo.readTypedLabel(testNode[1]._id, 'between')
                ])
                .then((result) ->
                    result[0].should.have.length 1
                    result[1].should.have.length 1
                    result[2].should.be.empty
                    result[3].should.have.length 1
                    result[4].should.have.length 1
                    result[5].should.be.empty
                    result[6].should.have.length 1
                    # result[7].should.throw 'Unsupported type between, e.g. all, in, out'

                    deleteLabelProperty(label)
                    done()
                )

    readNodeByLabel = (label) ->
        describe 'readNodeByLabel', ->
            it 'should pass', (done) ->
                Q.all([
                    # neo.readNodeByLabel('friend', { name: 'Test label 1' })
                    neo.readNodeByLabel('friend')
                ])
                .then((result) ->
                    console.log result
                    # result.should.include 'friend'

                    # readTypedLabel(label)
                    done()
                )
                .fail((result) ->
                    console.log result
                    # result.should.include 'friend'

                    # readTypedLabel(label)
                    done()
                )

    readLabel = ->
        describe 'readLabel', ->
            it 'should pass', (done) ->
                Q.all([
                    neo.readLabel(testNode._id)
                    neo.readLabel()
                ])
                .then (result) ->
                    result[0].should.include 'bestfriend'
                    result[0].should.include 'lover'

                    result[1].should.include 'bestfriend'
                    result[1].should.include 'lover'

                    readNodeByLabel()
                    done()

    updateLabel = ->
        describe 'updateLabel', ->
            it 'should pass', (done) ->
                neo.updateLabel(testNode._id, ['bestfriend', 'lover'])
                .then((result) ->
                    result.should.be.true

                    readLabel()
                    done()
                )

    createLabel = ->
        describe 'createLabel', ->
            it 'should pass', (done) ->
                Q.all([
                    neo.createLabel(testNode._id, 'friend')
                    neo.createLabel(testNode._id, ['friend', 'colleague'])
                ])
                .then((result) ->
                    result[0].should.be.true
                    result[1].should.be.true

                    updateLabel()
                    done()
                )

    createLabel()
