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

    describe 'neo.createNode({properties})', ->
        describe 'when valid', ->
            it 'should create a new node', ->
                neo
                .createNode({ name: 'Kieve' })
                .then((node) ->
                    node.should.have.property('name').equal 'Kieve'

                    testNode = node
                )

    describe 'neo.readNode(nodeId)', ->
        describe 'when valid', ->
            it 'should return node details', ->
                neo
                .readNode(testNode._id)
                .then((result) ->
                    result.name.should.equal 'Kieve'
                )

    describe 'neo.updateNodeProperty(nodeId, property, value)', ->
        describe 'when valid', ->
            it 'should update node property', ->
                neo
                .updateNodeProperty(testNode._id, 'gender', 'male')
                .should.eventually.be.true

    describe 'neo.updateNodeProperty(nodeId, {properties})', ->
        describe 'when valid', ->
            it 'should update node properties', ->
                neo
                .updateNodeProperty(testNode._id, { 'name': 'Kieve Chua', 'age': 17 })
                .should.eventually.be.true

    describe 'neo.readNodeProperty(nodeId)', ->
        describe 'when valid', ->
            it 'should return properties of a node', ->
                neo
                .readNodeProperty(testNode._id)
                .then (result) ->
                    result.name.should.equal 'Kieve Chua'
                    result.age.should.equal 17

    describe 'neo.deleteNodeProperty(nodeId, property)', ->
        describe 'when valid', ->
            it 'should delete node property', ->
                neo.deleteNodeProperty(testNode._id, 'name')
                .should.eventually.be.true

    describe 'neo.deleteNodeProperty(nodeId)', ->
        describe 'when valid', ->
            it 'should delete all property of a node', ->
                neo
                .deleteNodeProperty(testNode._id)
                .should.eventually.be.true

    describe 'neo.deleteNode(nodeId)', ->
        describe 'when valid', ->
            it 'should delete a node', ->
                neo
                .deleteNode(testNode._id)
                .should.eventually.be.true

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
