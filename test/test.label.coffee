Q = require 'q'
chai = require 'chai'
chaiAsPromised = require 'chai-as-promised'

chai.should()
chai.use(chaiAsPromised)

require("mocha-as-promised")()

{Neo4js} = require '../src/main'

describe 'Label', ->
    neo = new Neo4js()

    testNode = null

    before (done) ->
        neo
        .createNode({ name: 'Test label 1' })
        .then (node) ->
            testNode = node
            done()

    readNodeByLabel = ->
        describe 'readNodeByLabel', ->
            it 'should pass', (done) ->
                # Q.all([
                #     neo.readNodeByLabel('friend', { name: 'Test label 1' })
                # ])
                neo.readNodeByLabel('testbestfriend')
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
                    result[0].should.include 'testbestfriend'

                    result[1].should.include 'testbestfriend'
                    result[1].should.include 'friend'

                    readNodeByLabel()
                    done()

    describe 'createLabel', ->
        it 'should pass', ->
            neo
            .createLabel(testNode._id, ['friend', 'colleague'])
            .then((result) ->
                result.should.be.true
            )

        it 'should pass', ->
            neo
            .createLabel(testNode._id, 'friend')
            .then((result) ->
                result.should.be.true
            )

    describe 'updateLabel', ->
        it 'should pass', ->
            neo
            .updateLabel(testNode._id, ['testbestfriend'])
            .should.eventually.be.true

    after (done) ->
        neo
        .deleteNode(testNode._id)
        .then (node) ->
            done()
        .fail (node) ->
            done()
