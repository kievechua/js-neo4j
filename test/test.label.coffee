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
        Q.all([
            neo.createNode({ name: 'Test label 1' })
            neo.createNode({ name: 'Test label 2' })
        ])
        .then (result) ->
            testNode = result

            done()

    describe 'neo.createLabel(nodeId, [labels])', ->
        describe 'when valid', ->
            it 'should insert labels to a node', ->
                neo
                .createLabel(testNode[0]._id, ['testfriend', 'testcolleagu2e'])
                .should.eventually.be.true

    describe 'neo.createLabel(nodeId, label)', ->
        describe 'when valid', ->
            it 'should insert label to a node', ->
                neo
                .createLabel(testNode[1]._id, 'testfriend')
                .should.eventually.be.true

    describe 'neo.updateLabel(nodeId, labels)', ->
        describe 'when valid', ->
            it 'should replace labels of a node', ->
                neo
                .updateLabel(testNode[0]._id, ['testbestfriend'])
                .should.eventually.be.true

    describe 'neo.readLabel(nodeId)', ->
        describe 'when valid', ->
            it 'should return labels of a node', ->
                neo
                .readLabel(testNode[0]._id)
                .should.eventually.include 'testbestfriend'

    describe 'neo.readLabel()', ->
        describe 'when valid', ->
            it 'should return all labels of the database', ->
                neo
                .readLabel()
                .then (result) ->
                    result.should.include 'testbestfriend'
                    result.should.include 'testfriend'

    # describe 'readNodeByLabel', ->
    #     it 'should pass', ->
    #         neo
    #         .readNodeByLabel('testbestfriend')
    #         .then((result) ->
    #             console.log result
    #             # result.should.include 'friend'
    #         )
    #         .fail((result) ->
    #             console.log result
    #             # result.should.include 'friend'
    #         )

        # it 'should pass', ->
        #     neo
        #     .readNodeByLabel('testbestfriend', { name: 'Test label 2' })
        #     .then((result) ->
        #         console.log result
        #         # result.should.include 'friend'
        #     )
        #     .fail((result) ->
        #         console.log result
        #         # result.should.include 'friend'
        #     )

    #     it 'should pass', (done) ->
    #         # Q.all([
    #         #     neo.readNodeByLabel('friend', { name: 'Test label 1' })
    #         # ])
    #         neo
    #         .readNodeByLabel('testbestfriend')
    #         .then((result) ->
    #             console.log result
    #             # result.should.include 'friend'

    #             readTypedLabel()
    #             done()
    #         )
    #         .fail((result) ->
    #             console.log result
    #             # result.should.include 'friend'

    #             readTypedLabel()
    #             done()
    #         )

    describe 'neo.deleteLabel(nodeId, label)', ->
        describe 'when valid', ->
            it 'should remove label from a node', ->
                neo
                .deleteLabel(testNode[1]._id, 'testfriend')
                .should.eventually.be.true

    after ->
        Q.all([
            neo.deleteNode(testNode[0]._id)
            neo.deleteNode(testNode[1]._id)
        ])
