Q = require 'q'
chai = require 'chai'
chai.should()

{Neo4js} = require '../src/main'

describe 'Node', ->
    neo = new Neo4js()

    deleteNode = (node) ->
        describe 'deleteNode', ->
            it 'should pass', (done) ->
                neo.deleteNode(node._id).then((result) ->
                    result.should.be.true
                    done()
                )

    deleteNodeProperty = (node) ->
        describe 'deleteNodeProperty', ->
            it 'should pass', (done) ->
                Q.all([
                    neo.deleteNodeProperty(node._id, 'age')
                    neo.deleteNodeProperty(node._id)
                ])
                .then (result) ->
                    result[0].should.be.true
                    result[1].should.be.true

                    deleteNode(node)
                    done()

    readNodeProperty = (node) ->
        describe 'readNodeProperty', ->
            it 'should pass', (done) ->
                neo.readNodeProperty(node._id)
                .then (result) ->
                    result.name.should.equal 'Kieve Chua'
                    result.age.should.equal 17

                    deleteNodeProperty(node)
                    done()

    updateNodeProperty = (node) ->
        describe 'updateNodeProperty', ->
            it 'should pass', (done) ->
                Q.all([
                    neo.updateNodeProperty(node._id, 'gender', 'male')
                    neo.updateNodeProperty(node._id, { 'name': 'Kieve Chua', 'age': 17 })
                ])
                .then (result) ->
                    result[0].should.be.true
                    result[1].should.be.true

                    readNodeProperty(node)
                    done()

    readNode = (node) ->
        describe 'readNode', ->
            it 'should pass', (done) ->
                neo.readNode(node._id).then((result) ->
                    result.name.should.equal 'Kieve'

                    updateNodeProperty(node)
                    done()
                )

    createNode = ->
        describe 'createNode', ->
            it 'should pass', (done) ->
                neo.createNode({ name: 'Kieve' }).then((node) ->
                    node.name.should.equal 'Kieve'

                    readNode(node)
                    done()
                )

    createNode()

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
