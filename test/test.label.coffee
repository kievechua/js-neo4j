Q = require 'q'
chai = require 'chai'
chai.should()

{Neo4js} = require '../src/main'

describe 'Label', ->
    neo = new Neo4js()

    testNode = null

    console.log 1
    before (done) ->
        neo.createNode({ name: 'Test label 1' })
        .then (node) ->
            testNode = node
            done()

    # Unable to run in after(), as it run before everything finish
    after (done) ->
        console.log 2
        Q.all([
            neo.deleteNode(testNode._id)
            neo.deleteNode(testNode._id)
        ])
        .then (node) ->
            done()

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

    # updateLabel = ->

    # createLabel = ->
    describe 'createLabel', ->
        it 'should pass', ->
            console.log 3
            # Q.all([
            #     neo.createLabel(testNode._id, ['friend', 'colleague'])
            # ])
            neo.createLabel(testNode._id, 'friend')
            .then((result) ->
                console.log 4
                result.should.be.true
                # result[1].should.be.true

                updateLabel()
            )

            describe 'updateLabel', ->
                it 'should pass', (done) ->
                    console.log 5
                    neo.updateLabel(testNode._id, ['bestfriend'])
                    .then((result) ->
                        console.log 6
                        result.should.be.true

                        readLabel()
                        done()
                    )
    # createLabel()
