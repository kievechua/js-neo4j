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

    describe 'createLabel', ->
        it 'should pass', ->
            neo
            .createLabel(testNode[0]._id, ['testfriend', 'testcolleagu2e'])
            .should.eventually.be.true

        it 'should pass', ->
            neo
            .createLabel(testNode[1]._id, 'testfriend')
            .should.eventually.be.true

    describe 'updateLabel', ->
        it 'should pass', ->
            neo
            .updateLabel(testNode[0]._id, ['testbestfriend'])
            .should.eventually.be.true

    describe 'readLabel', ->
        it 'should pass', ->
            Q.all([
                neo.readLabel(testNode[0]._id),
                neo.readLabel()
            ])
            .then (result) ->
                result[0].should.include 'testbestfriend'

                result[1].should.include 'testbestfriend'
                result[1].should.include 'testfriend'

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

    describe 'deleteLabel', ->
        it 'should pass', ->
            neo
            .deleteLabel(testNode[1]._id, 'testfriend')
            .should.eventually.be.true

    after ->
        Q.all([
            neo.deleteNode(testNode[0]._id)
            neo.deleteNode(testNode[1]._id)
        ])
