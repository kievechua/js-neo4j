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

    describe 'neo.executeCypher(query, parameters)', ->
        describe 'when valid', ->
            it 'should run cypher query', ->
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

    describe 'neo.queryBuilder()', ->
        queryBuilder = null

        beforeEach ->
            queryBuilder = neo.queryBuilder()

        describe 'queryBuilder.cypher(query)', ->
            describe 'when valid', ->
                it 'should construct correct cypher query', ->
                    queryBuilder
                    .cypher('START n = node(*)')
                    .toString().should.equal 'START n = node(*)'

        describe 'queryBuilder.direction(query)', ->
            describe 'n', ->
                describe 'when valid', ->
                    it 'should construct correct cypher query', ->
                        queryBuilder
                        .direction('n')
                        .toString().should.equal '()'

            describe 'tn', ->
                describe 'when valid', ->
                    it 'should construct correct cypher query', ->
                        queryBuilder
                        .direction('tn=n')
                        .toString().should.equal '-->(n)'

            describe 'fn', ->
                describe 'when valid', ->
                    it 'should construct correct cypher query', ->
                        queryBuilder
                        .direction('fn=n')
                        .toString().should.equal '<--(n)'

            describe 'r', ->
                describe 'when valid', ->
                    it 'should construct correct cypher query', ->
                        queryBuilder
                        .direction('r=r')
                        .toString().should.equal '-[r]->'

            describe 'tr', ->
                describe 'when valid', ->
                    it 'should construct correct cypher query', ->
                        queryBuilder
                        .direction('tr=r')
                        .toString().should.equal '-[r]->'

            describe 'fr', ->
                describe 'when valid', ->
                    it 'should construct correct cypher query', ->
                        queryBuilder
                        .direction('fr=r')
                        .toString().should.equal '<-[r]-'

            describe 'or', ->
                describe 'when valid', ->
                    it 'should construct correct cypher query', ->
                        queryBuilder
                        .direction('or=r')
                        .toString().should.equal '<-[r]->'

            describe 'ir', ->
                describe 'when valid', ->
                    it 'should construct correct cypher query', ->
                        queryBuilder
                        .direction('ir=r')
                        .toString().should.equal '-[r]-'

            describe '--', ->
                describe 'when valid', ->
                    it 'should construct correct cypher query', ->
                        queryBuilder
                        .direction('--')
                        .toString().should.equal '--'

            describe 'chaining', ->
                describe 'when valid', ->
                    it 'should construct correct cypher query', ->
                        queryBuilder
                        .direction('n=n/r=friend/n=m')
                        .toString().should.equal '(n)-[friend]->(m)'

        describe 'queryBuilder.start(query)', ->
            describe 'when valid', ->
                it 'should construct correct cypher query', ->
                    queryBuilder
                    .start('*')
                    .toString().should.equal 'START n = node(*)'

        describe 'queryBuilder.start(nodeId)', ->
            describe 'when valid', ->
                it 'should construct correct cypher query', ->
                    queryBuilder
                    .start(1)
                    .toString().should.equal 'START n = node({id})'

                    queryBuilder
                    .getParams().should.include.keys('id')

                    queryBuilder
                    .getParams().id.should.equal 1

        describe 'queryBuilder.start(query)', ->
            describe 'when valid', ->
                it 'should construct correct cypher query', ->
                    queryBuilder
                    .start('n = node(*)')
                    .toString().should.equal 'START n = node(*)'

        describe 'queryBuilder.start({query})', ->
            describe 'when valid', ->
                it 'should construct correct cypher query', ->
                    queryBuilder
                    .start({ name: 'Kieve' })
                    .toString().should.equal 'START name = node({name})'

                    queryBuilder
                    .getParams().should.include.keys('name')

                    queryBuilder
                    .getParams().name.should.equal 'Kieve'

        describe 'queryBuilder.start(query, true)', ->
            describe 'when valid', ->
                it 'should construct correct cypher query', ->
                    queryBuilder
                    .start('*', true)
                    .toString().should.equal 'START r = relationship(*)'

        describe 'queryBuilder.start(nodeId, true)', ->
            describe 'when valid', ->
                it 'should construct correct cypher query', ->
                    queryBuilder
                    .start(1, true)
                    .toString().should.equal 'START r = relationship({id})'

                    queryBuilder
                    .getParams().should.include.keys('id')

                    queryBuilder
                    .getParams().id.should.equal 1

        describe 'queryBuilder.create(query)', ->
            describe 'when valid', ->
                it 'should create normal query', ->
                    queryBuilder
                    .create('n')
                    .toString().should.equal 'CREATE n'

        describe 'queryBuilder.create(query, true)', ->
            describe 'when valid', ->
                it 'should create unique query', ->
                    queryBuilder
                    .create('n', true)
                    .toString().should.equal 'CREATE UNIQUE n'

        describe 'queryBuilder.match(query)', ->
            describe 'when valid', ->
                it 'should construct correct cypher query', ->
                    queryBuilder
                    .match('(movie:Movie)')
                    .toString().should.equal 'MATCH (movie:Movie)'

        describe 'queryBuilder.where(query)', ->
            describe 'when valid', ->
                it 'should construct correct cypher query', ->
                    queryBuilder
                    .where('n:Swedish')
                    .toString().should.equal 'WHERE n:Swedish'

        describe 'queryBuilder.with(query)', ->
            describe 'when valid', ->
                it 'should construct correct cypher query', ->
                    queryBuilder
                    .with('m')
                    .toString().should.equal 'WITH m'

        describe 'queryBuilder.set(query)', ->
            describe 'when valid', ->
                it 'should construct correct cypher query', ->
                    queryBuilder
                    .set("n.surname = 'Kieve'")
                    .toString().should.equal "SET n.surname = 'Kieve'"

        describe 'queryBuilder.merge(query)', ->
            describe 'when valid', ->
                it 'should construct correct cypher query', ->
                    queryBuilder
                    .merge('kieve:Critic')
                    .toString().should.equal 'MERGE (kieve:Critic)'

        describe 'queryBuilder.drop(query)', ->
            describe 'when valid', ->
                it 'should construct correct cypher query', ->
                    queryBuilder
                    .drop('(movie:Movie)')
                    .toString().should.equal 'DROP (movie:Movie)'

        describe 'queryBuilder.remove(query)', ->
            describe 'when valid', ->
                it 'should construct correct cypher query', ->
                    queryBuilder
                    .remove('kieve.age')
                    .toString().should.equal 'REMOVE kieve.age'

        describe 'queryBuilder.del(query)', ->
            describe 'when valid', ->
                it 'should construct correct cypher query', ->
                    queryBuilder
                    .del('n')
                    .toString().should.equal 'DELETE n'

        describe 'queryBuilder.del([query])', ->
            describe 'when valid', ->
                it 'should construct correct cypher query', ->
                    queryBuilder
                    .del(['n', 'm'])
                    .toString().should.equal 'DELETE n, m'

        describe 'queryBuilder.foreach([query])', ->
            describe 'when valid', ->
                it 'should construct correct cypher query', ->
                    queryBuilder
                    .foreach('(n IN nodes(p)| SET n.marked = TRUE )')
                    .toString().should.equal 'FOREACH (n IN nodes(p)| SET n.marked = TRUE )'

        describe 'queryBuilder.return(query)', ->
            describe 'when valid', ->
                it 'should construct correct cypher query', ->
                    queryBuilder
                    .return('n')
                    .toString().should.equal 'RETURN n'

        describe 'queryBuilder.return([query])', ->
            describe 'when valid', ->
                it 'should construct correct cypher query', ->
                    queryBuilder
                    .return(['name', 'age'])
                    .toString().should.equal 'RETURN n.name, n.age'

        describe 'queryBuilder.return({query})', ->
            describe 'when valid', ->
                it 'should construct correct cypher query', ->
                    queryBuilder
                    .return({'name': 'Name', 'age': 'Age'})
                    .toString().should.equal 'RETURN n.name AS Name, n.age AS Age'

        describe 'queryBuilder.return([query], true)', ->
            describe 'when valid', ->
                it 'should construct correct cypher query', ->
                    queryBuilder
                    .return(['name', 'age'], true)
                    .toString().should.equal 'RETURN r.name, r.age'

        describe 'queryBuilder.return({query}, true)', ->
            describe 'when valid', ->
                it 'should construct correct cypher query', ->
                    queryBuilder
                    .return({'name': 'Name', 'age': 'Age'}, true)
                    .toString().should.equal 'RETURN r.name AS Name, r.age AS Age'

        describe 'queryBuilder.union([query])', ->
            describe 'when valid', ->
                it 'should construct correct cypher query', ->
                    queryBuilder
                    .union('all')
                    .toString().should.equal 'UNION ALL'

        describe 'queryBuilder.using(query)', ->
            describe 'when valid', ->
                it 'should construct correct cypher query', ->
                    queryBuilder
                    .using('n:Swedish(surname)')
                    .toString().should.equal 'USING n:Swedish(surname)'

        describe 'queryBuilder.using(query, parameter)', ->
            describe 'when valid', ->
                it 'should construct correct cypher query', ->
                    queryBuilder
                    .using('n:Swedish(surname)', 'INDEX')
                    .toString().should.equal 'USING INDEX n:Swedish(surname)'

        describe 'queryBuilder.orderBy(query)', ->
            describe 'when valid', ->
                it 'should construct correct cypher query', ->
                    queryBuilder
                    .orderBy('n.name')
                    .toString().should.equal 'ORDER BY n.name'

        describe 'queryBuilder.orderBy([query])', ->
            describe 'when valid', ->
                it 'should construct correct cypher query', ->
                    queryBuilder
                    .orderBy(['name', 'age'])
                    .toString().should.equal 'ORDER BY n.name, n.age'

        describe 'queryBuilder.orderBy({query})', ->
            describe 'when valid', ->
                it 'should construct correct cypher query', ->
                    queryBuilder
                    .orderBy({ 'name': 'asc', 'age': 1, 'gender': true })
                    .toString().should.equal 'ORDER BY n.name ASC, n.age ASC, n.gender ASC'

        describe 'queryBuilder.orderBy([query], true)', ->
            describe 'when valid', ->
                it 'should construct correct cypher query', ->
                    queryBuilder
                    .orderBy(['name', 'age'], true)
                    .toString().should.equal 'ORDER BY r.name, r.age'

        describe 'queryBuilder.orderBy({query}, true)', ->
            describe 'when valid', ->
                it 'should construct correct cypher query', ->
                    queryBuilder
                    .orderBy({ 'name': 'asc', 'age': 1, 'gender': true }, true)
                    .toString().should.equal 'ORDER BY r.name ASC, r.age ASC, r.gender ASC'

        describe 'queryBuilder.skip(skip)', ->
            describe 'when valid', ->
                it 'should construct correct cypher query', ->
                    queryBuilder
                    .skip(1)
                    .toString().should.equal 'SKIP 1'

        describe 'queryBuilder.limit(limit)', ->
            describe 'when valid', ->
                it 'should construct correct cypher query', ->
                    queryBuilder
                    .limit(1)
                    .toString().should.equal 'LIMIT 1'

        describe 'queryBuilder.limit(limit, step)', ->
            describe 'when valid', ->
                it 'should construct correct cypher query', ->
                    queryBuilder
                    .limit(1, 2)
                    .toString().should.equal 'LIMIT 1 SKIP 2'

        describe 'queryBuilder.getList(type)', ->
            describe 'when valid', ->
                it 'should construct correct cypher query', ->
                    queryBuilder
                    .getList('function')
                    .should.deep.equal [
                        'ALL', 'ANY', 'NONE', 'SINGLE',
                        'LENGTH', 'TYPE', 'ID', 'COALESCE', 'HEAD', 'LAST', 'TIMESTAMP', 'STARTNODE', 'ENDNODE',
                        'NODES', 'RELATIONSHIPS', 'LABELS', 'EXTRACT', 'FILTER', 'TAIL', 'RANGE', 'REDUCE',
                        'ABS', 'ACOS', 'ASIN', 'ATAN', 'COS', 'COT', 'DEGREES', 'E', 'EXP', 'FLOOR', 'HAVERSIN', 'LOG', 'LOG10', 'PI', 'RADIANS', 'RAND', 'ROUND', 'SIGN', 'SIN', 'SQRT', 'TAN',
                        'STR', 'REPLACE', 'SUBSTRING', 'LEFT', 'RIGHT', 'LTRIM', 'RTRIM', 'TRIM', 'LOWER', 'UPPER'
                    ]

        describe 'queryBuilder.execute()', ->
            describe 'when valid', ->
                it 'should run cypher query', ->
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
