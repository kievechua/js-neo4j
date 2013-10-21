Q = require 'q'
chai = require 'chai'
chaiAsPromised = require 'chai-as-promised'

chai.should()
chai.use(chaiAsPromised)

require("mocha-as-promised")()

{Neo4js} = require '../src/main'

describe 'Cypher', ->
    neo = new Neo4js()

    testNode = null

    before (done) ->
        Q.all([
            neo.createNode({ name: 'Test cypher 1' })
            neo.createNode({ name: 'Test cypher 2' })
        ])
        .then (result) ->
            testNode = result

            done()

    describe 'executeCypher', ->
        it 'should pass', ->
            neo
            .executeCypher(
                'START n = node({nodeId}) RETURN n'
                {
                    "nodeId" : parseInt(testNode[0]._id)
                }
            )
            .then((result) ->
                result.should.include.keys('columns')
            )

    describe 'queryBuilder', ->
        queryBuilder = null

        beforeEach ->
            queryBuilder = neo.queryBuilder()

        describe 'direction', ->
            describe 'n', ->
                it 'should pass', ->
                    queryBuilder.direction('n').toString().should.equal '()'

            describe 'tn', ->
                it 'should pass', ->
                    queryBuilder.direction('tn=n').toString().should.equal '-->(n)'

            describe 'fn', ->
                it 'should pass', ->
                    queryBuilder.direction('fn=n').toString().should.equal '<--(n)'

            describe 'r', ->
                it 'should pass', ->
                    queryBuilder.direction('r=r').toString().should.equal '-[r]->'

            describe 'tr', ->
                it 'should pass', ->
                    queryBuilder.direction('tr=r').toString().should.equal '-[r]->'

            describe 'fr', ->
                it 'should pass', ->
                    queryBuilder.direction('fr=r').toString().should.equal '<-[r]-'

            describe 'or', ->
                it 'should pass', ->
                    queryBuilder.direction('or=r').toString().should.equal '<-[r]->'

            describe 'ir', ->
                it 'should pass', ->
                    queryBuilder.direction('ir=r').toString().should.equal '-[r]-'

            describe '--', ->
                it 'should pass', ->
                    queryBuilder.direction('--').toString().should.equal '--'

            describe 'chaining', ->
                it 'should pass', ->
                    queryBuilder.direction('n=n/r=friend/n=m').toString().should.equal '(n)-[friend]->(m)'

    after ->
        Q.all([
            neo.deleteNode(testNode[0]._id)
            neo.deleteNode(testNode[1]._id)
        ])
