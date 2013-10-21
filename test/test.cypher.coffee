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

        describe 'cypher', ->
            it 'should pass', ->
                queryBuilder.cypher('START n = node(*)').toString().should.equal 'START n = node(*)'

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

        describe 'start', ->
            describe 'node', ->
                it 'should pass', ->
                    queryBuilder.start('*').toString().should.equal 'START n = node(*)'

                it 'should pass', ->
                    queryBuilder.start(1).toString().should.equal 'START n = node({id})'
                    queryBuilder.getParams().should.include.keys('id')
                    queryBuilder.getParams().id.should.equal 1

                it 'should pass', ->
                    queryBuilder.start('n = node(*)').toString().should.equal 'START n = node(*)'

                it 'should pass', ->
                    queryBuilder.start({ name: 'Kieve' }).toString().should.equal 'START name = node({name})'
                    queryBuilder.getParams().should.include.keys('name')
                    queryBuilder.getParams().name.should.equal 'Kieve'

            describe 'relationship', ->
                it 'should pass', ->
                    queryBuilder.start('*', true).toString().should.equal 'START r = relationship(*)'

                it 'should pass', ->
                    queryBuilder.start(1, true).toString().should.equal 'START r = relationship({id})'
                    queryBuilder.getParams().should.include.keys('id')
                    queryBuilder.getParams().id.should.equal 1

        describe 'create', ->
            describe 'normal', ->
                it 'should pass', ->
                    queryBuilder.create('n').toString().should.equal 'CREATE n'

            describe 'unique', ->
                it 'should pass', ->
                    queryBuilder.create('n', true).toString().should.equal 'CREATE UNIQUE n'

        describe 'match', ->
            it 'should pass', ->
                queryBuilder.match('(movie:Movie)').toString().should.equal 'MATCH (movie:Movie)'

        describe 'where', ->
            it 'should pass', ->
                queryBuilder.where('n:Swedish').toString().should.equal 'WHERE n:Swedish'

        describe 'with', ->
            it 'should pass', ->
                queryBuilder.with('m').toString().should.equal 'WITH m'

        describe 'set', ->
            it 'should pass', ->
                queryBuilder.set("n.surname = 'Kieve'").toString().should.equal "SET n.surname = 'Kieve'"

        describe 'merge', ->
            it 'should pass', ->
                queryBuilder.merge('kieve:Critic').toString().should.equal 'MERGE (kieve:Critic)'

        describe 'drop', ->
            it 'should pass', ->
                queryBuilder.drop('(movie:Movie)').toString().should.equal 'DROP (movie:Movie)'

        describe 'remove', ->
            it 'should pass', ->
                queryBuilder.remove('kieve.age').toString().should.equal 'REMOVE kieve.age'

        describe 'delete', ->
            describe 'string', ->
                it 'should pass', ->
                    queryBuilder.del('n').toString().should.equal 'DELETE n'

            describe 'array', ->
                it 'should pass', ->
                    queryBuilder.del(['n', 'm']).toString().should.equal 'DELETE n, m'

        describe 'foreach', ->
            it 'should pass', ->
                queryBuilder.foreach('(n IN nodes(p)| SET n.marked = TRUE )').toString().should.equal 'FOREACH (n IN nodes(p)| SET n.marked = TRUE )'

        describe 'return', ->
            describe 'node', ->
                it 'should pass', ->
                    queryBuilder.return('n').toString().should.equal 'RETURN n'

                it 'should pass', ->
                    queryBuilder.return(['name', 'age']).toString().should.equal 'RETURN n.name, n.age'

                it 'should pass', ->
                    queryBuilder.return({'name': 'Name', 'age': 'Age'}).toString().should.equal 'RETURN n.name AS Name, n.age AS Age'

            describe 'relationship', ->
                it 'should pass', ->
                    queryBuilder.return(['name', 'age'], true).toString().should.equal 'RETURN r.name, r.age'

                it 'should pass', ->
                    queryBuilder.return({'name': 'Name', 'age': 'Age'}, true).toString().should.equal 'RETURN r.name AS Name, r.age AS Age'

        describe 'union', ->
            it 'should pass', ->
                queryBuilder.union('all').toString().should.equal 'UNION ALL'

        describe 'using', ->
            describe 'without param', ->
                it 'should pass', ->
                    queryBuilder.using('n:Swedish(surname)').toString().should.equal 'USING n:Swedish(surname)'

            describe 'with param', ->
                it 'should pass', ->
                    queryBuilder.using('n:Swedish(surname)', 'INDEX').toString().should.equal 'USING INDEX n:Swedish(surname)'

        describe 'orderBy', ->
            describe 'node', ->
                it 'should pass', ->
                    queryBuilder.orderBy('n.name').toString().should.equal 'ORDER BY n.name'

                it 'should pass', ->
                    queryBuilder.orderBy(['name', 'age']).toString().should.equal 'ORDER BY n.name, n.age'

                it 'should pass', ->
                    queryBuilder.orderBy({ 'name': 'asc', 'age': 1, 'gender': true }).toString().should.equal 'ORDER BY n.name ASC, n.age ASC, n.gender ASC'

            describe 'relationship', ->
                it 'should pass', ->
                    queryBuilder.orderBy(['name', 'age'], true).toString().should.equal 'ORDER BY r.name, r.age'

                it 'should pass', ->
                    queryBuilder.orderBy({ 'name': 'asc', 'age': 1, 'gender': true }, true).toString().should.equal 'ORDER BY r.name ASC, r.age ASC, r.gender ASC'

        describe 'skip', ->
            it 'should pass', ->
                queryBuilder.skip(1).toString().should.equal 'SKIP 1'

        describe 'limit', ->
            it 'should pass', ->
                queryBuilder.limit(1).toString().should.equal 'LIMIT 1'

            it 'should pass', ->
                queryBuilder.limit(1, 2).toString().should.equal 'LIMIT 1 SKIP 2'

        describe 'getFunctionList', ->
            it 'should pass', ->
                queryBuilder.getList('function').should.deep.equal [
                    'ALL', 'ANY', 'NONE', 'SINGLE',
                    'LENGTH', 'TYPE', 'ID', 'COALESCE', 'HEAD', 'LAST', 'TIMESTAMP', 'STARTNODE', 'ENDNODE',
                    'NODES', 'RELATIONSHIPS', 'LABELS', 'EXTRACT', 'FILTER', 'TAIL', 'RANGE', 'REDUCE',
                    'ABS', 'ACOS', 'ASIN', 'ATAN', 'COS', 'COT', 'DEGREES', 'E', 'EXP', 'FLOOR', 'HAVERSIN', 'LOG', 'LOG10', 'PI', 'RADIANS', 'RAND', 'ROUND', 'SIGN', 'SIN', 'SQRT', 'TAN',
                    'STR', 'REPLACE', 'SUBSTRING', 'LEFT', 'RIGHT', 'LTRIM', 'RTRIM', 'TRIM', 'LOWER', 'UPPER'
                ]

        describe 'execute', ->
            it 'should pass', ->
                true.should.be.true

                result = queryBuilder
                            .start('*')
                            .return('*')
                            .execute()

                result.should.eventually.include.keys('data')

    after ->
        Q.all([
            neo.deleteNode(testNode[0]._id)
            neo.deleteNode(testNode[1]._id)
        ])
