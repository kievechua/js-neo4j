Q = require 'q'
chai = require 'chai'
chaiAsPromised = require 'chai-as-promised'

chai.should()
chai.use(chaiAsPromised)

require("mocha-as-promised")()

{Neo4js} = require '../src/main'

describe 'Node', ->
    neo = new Neo4js()

    testNode = null

    describe 'createNode', ->
        it 'should pass', ->
            neo
            .createNode({ name: 'Kieve' })
            .then((node) ->
                node.should.have.property('name').equal 'Kieve'

                testNode = node
            )

    describe 'readNode', ->
        it 'should pass', ->
            neo
            .readNode(testNode._id)
            .then((result) ->
                result.name.should.equal 'Kieve'
            )

    describe 'updateNodeProperty', ->
        it 'should pass', ->
            Q.all([
                neo.updateNodeProperty(testNode._id, 'gender', 'male')
                neo.updateNodeProperty(testNode._id, { 'name': 'Kieve Chua', 'age': 17 })
            ])
            .then (result) ->
                result[0].should.be.true
                result[1].should.be.true

    describe 'readNodeProperty', ->
        it 'should pass', ->
            neo
            .readNodeProperty(testNode._id)
            .then (result) ->
                result.name.should.equal 'Kieve Chua'
                result.age.should.equal 17

    describe 'deleteNodeProperty', ->
        it 'should pass', ->
            Q.all([
                neo.deleteNodeProperty(testNode._id, 'name')
                neo.deleteNodeProperty(testNode._id)
            ])
            .then (result) ->
                result[0].should.be.true
                result[1].should.be.true

    describe 'deleteNode', ->
        it 'should pass', ->
            neo.deleteNode(testNode._id).should.eventually.be.true

    # describe 'createUniqueNode', ->
    #     it 'should pass', (done) ->
    #         neo.createUniqueNode('people', 'name', 'Kieve', { age: 18 }).then((node) ->
    #             node.age.should.equal 18

    #             done()
    #         )

    #     it 'should pass or fail', (done) ->
    #         neo.createUniqueNode('people', 'name', 'Kieve', { age: 19 }, 'create_or_fail')
    #         .then((node) ->
    #             node.age.should.equal 19
    #         )
    #         .fail((result) ->
    #             result.status.should.equal 409
    #         )
    #         .done(->
    #             done()
    #         )
