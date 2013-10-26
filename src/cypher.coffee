_ = require 'lodash'
utils = require './utils'

###
neo
.queryBuilder()
.start('*')
.return('*')
.execute()
.fail((data) ->
    console.log 'error', arguments
)
.then((data) ->
    console.log data
)
###
class Cypher
    @FUNCTION_LIST = [
        # Predicates
        'ALL', 'ANY', 'NONE', 'SINGLE',
        # Scalar functions
        'LENGTH', 'TYPE', 'ID', 'COALESCE', 'HEAD', 'LAST', 'TIMESTAMP', 'STARTNODE', 'ENDNODE',
        # Collection functions
        'NODES', 'RELATIONSHIPS', 'LABELS', 'EXTRACT', 'FILTER', 'TAIL', 'RANGE', 'REDUCE',
        # Mathematical functions
        'ABS', 'ACOS', 'ASIN', 'ATAN', 'COS', 'COT', 'DEGREES', 'E', 'EXP', 'FLOOR', 'HAVERSIN', 'LOG', 'LOG10', 'PI', 'RADIANS', 'RAND', 'ROUND', 'SIGN', 'SIN', 'SQRT', 'TAN',
        # String functions
        'STR', 'REPLACE', 'SUBSTRING', 'LEFT', 'RIGHT', 'LTRIM', 'RTRIM', 'TRIM', 'LOWER', 'UPPER'
    ]

    @QUERY_LIST = [
        'START', 'CREATE', 'SET', 'DELETE', 'FOREACH', 'MATCH', 'WHERE', 'WITH'
        'RETURN', 'SKIP', 'LIMIT', 'ORDER', 'BY', 'ASC', 'DESC', 'ON', 'WHEN',
        'CASE', 'THEN', 'ELSE', 'DROP', 'USING', 'MERGE', 'CONSTRAINT', 'ASSERT'
        'SCAN', 'REMOVE', 'UNION'
    ]

    @OPERATION_LIST = [
        '+', '-', '*', '/', '%',
        '=', '<>', '<', '>', '<=', '>=',
        'AND', 'OR', 'XOR', 'NOT'
    ]

    constructor: (@url) ->
        @_query = []
        @_params = {}

    # Insert any cypher query
    cypher: (query) ->
        @_query.push query
        return @

    ###
    EXPERIMENTAL
    Node direction & relationship builder
    ```
    neo.direction('n=a/tr=love/n') // (a)-[love]->()
    ```
    ###
    direction: (query) ->
        temp = []

        if _.isString query
            for value in query.split('/')
                direction = value.split('=')
                param = direction[1] or ''

                switch direction[0]
                    # Node, e.g. (), (s)
                    when 'n'
                        temp.push "(#{param})"
                    # To node, e.g. -->(), -->(s)
                    when 'tn'
                        temp.push "-->(#{param})"
                    # From node, e.g. <--(), <--(s)
                    when 'fn'
                        temp.push "<--(#{param})"
                    # To relationship, e.g. -[]->, -[r]->
                    when 'tr', 'r'
                        temp.push "-[#{param}]->"
                    # From relationship, e.g. <-[]-, <-[r]-
                    when 'fr'
                        temp.push "<-[#{param}]-"
                    # Outbound relationship, e.g. <-[]->, <-[r]->
                    when 'or'
                        temp.push "<-[#{param}]->"
                    # Ignore relationship, e.g. -[]-, -[r]-
                    when 'ir'
                        temp.push "-[#{param}]-"
                    # e.g. --
                    when '--'
                        temp.push '--'

            @_query.push temp.join('')

        return @

    ###
    Build start node
    ```
    neo.start('*') // START n = node(*)
    neo.start(1) // START n = node(1), { id: 1 }
    neo.start({ r: '*' }) // START r = relationship(*)
    neo.start('n = node(*)') // START n = node(*)
    ```
    ###
    start: (query, isRelationship) ->
        if isRelationship
            holder = 'r'
            label = 'relationship'
        else
            holder = 'n'
            label = 'node'

        if query is '*'
            query = "START #{holder} = #{label}(*)"
        else if _.isNumber(query) or _.isArray(query)
            @_params['id'] = query
            query = "START #{holder} = #{label}({id})"
        else if _.isString query
            query = "START #{query}"
        else if _.isObject query
            temp = 'START '

            for key, value of query
                if temp isnt 'START ' then temp += ', '

                temp += "#{key} = #{label}({#{key}})"

                @_params[key] = value

            query = temp
        else
            throw new Error('Unsupported type')

        @_query.push query

        return @

    # neo.create(n) // CREATE (n)
    # neo.create(n, true) // CREATE UNIQUE (n)
    create: (query, param) ->
        if param then query = "UNIQUE #{query}"

        @_query.push "CREATE #{query}"

        return @

    drop: (query) ->
        @_query.push "DROP #{query}"

        return @

    match: (query) ->
        @_query.push "MATCH #{query}"

        return @

    where: (query) ->
        @_query.push "WHERE #{query}"

        return @

    with: (query) ->
        @_query.push "WITH #{query}"

        return @

    set: (query) ->
        @_query.push "SET #{query}"

        return @

    merge: (query) ->
        @_query.push "MERGE (#{query})"

        return @

    remove: (query) ->
        @_query.push "REMOVE #{query}"

        return @

    del: (query) ->
        if _.isArray query
            query = query.join ', '

        @_query.push "DELETE #{query}"

        return @

    foreach: (query) ->
        @_query.push "FOREACH #{query}"

        return @

    return: (query, isRelationship) ->
        if isRelationship
            holder = 'r'
        else
            holder = 'n'

        if _.isArray query
            temp = 'RETURN '

            for q in query
                if temp isnt 'RETURN ' then temp += ', '

                temp += "#{holder}.#{q}"

            query = temp
        else if _.isObject query
            temp = 'RETURN '

            for key, value of query
                if temp isnt 'RETURN ' then temp += ', '

                temp += "#{holder}.#{key} AS #{value}"

            query = temp
        else if _.isString query
            query = "RETURN #{query}"
        else
            throw new Error('Unsupported type')

        @_query.push query

        return @

    using: (query, param = '') ->
        if param.toLowerCase() is 'index' or param.toLowerCase() is 'scan'
            query = "USING #{param.toUpperCase()} #{query}"
        else
            query = "USING #{query}"

        @_query.push query

        return @

    union: (query) ->
        if query is 'all'
            query = 'UNION ALL'
        else
            query = 'UNION'

        @_query.push query

        return @

    orderBy: (query, isRelationship) ->
        if isRelationship
            holder = 'r'
        else
            holder = 'n'

        if _.isString query
            query = "ORDER BY #{query}"
        else if _.isArray query
            temp = 'ORDER BY '

            for q in query
                if temp isnt 'ORDER BY ' then temp += ', '

                temp += "#{holder}.#{q}"

            query = temp
        else if _.isObject query
            temp = 'ORDER BY '

            for key, value of query
                if temp isnt 'ORDER BY ' then temp += ', '

                if value and value.toLowerCase isnt 'desc'
                    value = 'ASC'
                else
                    value = 'DESC'

                temp += "#{holder}.#{key} #{value}"

            query = temp
        else
            throw new Error('Unsupported type')

        @_query.push query

        return @

    limit: (limit, skip) ->
        limit = _.parseInt(limit) or 0
        skip = _.parseInt(skip) or 0

        if skip
            @_query.push "LIMIT #{limit} SKIP #{skip}"
        else
            @_query.push "LIMIT #{limit}"

        return @

    skip: (query) ->
        query = _.parseInt(query) or 0

        @_query.push "SKIP #{query}"

        return @

    toString: ->
        @_query.join(' ')

    getParams: -> @_params

    # For development use only
    getList: (keyword) ->
        if keyword is 'function'
            @constructor.FUNCTION_LIST
        else if keyword is 'query'
            @constructor.QUERY_LIST
        else if keyword is 'operation'
            @constructor.OPERATION_LIST
        else
            _.union @constructor.FUNCTION_LIST, @constructor.QUERY_LIST, @constructor.OPERATION_LIST

    execute: (params = @_params) ->
        utils.post(
            "#{@url}/db/data/cypher",
            {
                query: @toString()
                params: @_params
            }
            (result) -> result.body
        )

module.exports =
    # ###Execute cypher query
    ###
    Without properties [Details](http://docs.neo4j.org/chunked/milestone/rest-api-nodes.html#rest-api-create-node)
    ```
    neo
    .executeCypher(
        'CREATE (n:Person { name : {name} }) RETURN n'
        {
            "name" : "Kieve"
        }
    )
    ```
    ###
    executeCypher: (query, params) ->
        utils.post(
            "#{@url}/db/data/cypher"
            {
                query: query
                params: params
            }
            (result) -> result.body
        )

    # ###Return query builder class
    ###
    Without properties [Details](http://docs.neo4j.org/chunked/milestone/rest-api-nodes.html#rest-api-create-node)
    ```
    neo
    .queryBuilder()
    .start('*')
    .return('*')
    .execute()
    ```
    ###
    queryBuilder: -> new Cypher(@url)
