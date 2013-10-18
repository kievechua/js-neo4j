_ = require 'lodash'
utils = require './utils'

RESERVED = [ 'start', 'create', 'set', 'delete', 'foreach', 'match', 'where', 'with'
             'return', 'skip', 'limit', 'order', 'by', 'asc', 'desc', 'on', 'when',
             'case', 'then', 'else', 'drop', 'using', 'merge', 'constraint', 'assert'
             'scan', 'remove', 'union', 'all', 'any', 'none', 'single', 'length',
             'type', 'id', 'coalesce', 'head', 'last', 'timestamp', 'startnode',
             'endNode', 'nodes', 'relationships', 'labels', 'extract', 'filter',
             'tail', 'range', 'reduce', 'abs', 'acos', 'asin', 'atan', 'cos', 'cot',
             'degrees', 'e', 'exp', 'floor', 'log', 'log10', 'pi', 'radians', 'rand',
             'round', 'sign', 'sin', 'sqrt', 'tan', 'str', 'replace', 'substring',
             'left', 'right', 'ltrim', 'rtrim', 'trim', 'lower', 'upper' ]

INVALID_IDEN = /\W/

QUERY_PARTS = [ 'start', 'match', 'where', 'with', 'set', 'delete', 'forach', 'return'
                'union', 'union all', 'order by', 'limit', 'skip' ]

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
    constructor: (url) ->
        if url
            @url = url
        else
            @url = 'http://localhost:7474'

        @_query = []
        @_params = {}

    # Insert any cypher query
    cypher: (query) ->
        @_query.push query
        return @

    ###
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
                    when 'tr'
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
    neo.start() // START
    neo.start('*') // START n = node(*)
    neo.start(1) // START n = node(1), { id: 1 }
    neo.start([1, 2]) // START n = node([1, 2]), { id: [1, 2] }
    neo.start([1, 2]) // START n = node([1, 2]), { id: [1, 2] }
    ```
    ###
    start: (query) ->
        if query is '*'
            query = 'START n = node(*)'
        else if _.isNumber(query) or _.isArray(query)
            @_params['id'] = query
            query = 'START n = node({id})'
        else if _.isObject query
            if _.isEmpty query.r
                temp = 'START '

                for key, value of query
                    if temp isnt 'START ' then temp += ', '

                    temp += "#{key} = node({#{key}})"

                    @_params[key] = value

                query = temp
            else if query.r is '*'
                query = 'START n = relationship(*)'
            else if _.isNumber(query.r) or _.isArray(query.r) or query is '*'
                @_params['id'] = query.r

                query = 'START n = relationship({id})'
            else if _.isObject query.r
                temp = 'START '

                for key, value of query.r
                    if temp isnt 'START ' then temp += ', '

                    temp += "#{key} = relationship({#{key}})"

                    @_params[key] = value

                query = temp
        else if _.isString query
            query = "START #{query}"
        else
            throw new Error('Unsupported type')

        @_query.push query

        return @

    create: (param, query) ->
        if param is 'unique' then query = "UNIQUE #{query}"

        @_query.push "CREATE #{query}"

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

    drop: (query) ->
        @_query.push "DROP INDEX ON #{query}"

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

    return: (query) ->
        if _.isArray query
            temp = 'RETURN '

            for q in query
                if temp isnt 'RETURN ' then temp += ', '

                temp += "n.#{q}"

            query = temp
        else if _.isObject query
            unless _.isEmpty query.r
                if _.isArray query.r
                    temp = 'RETURN '

                    for q in query.r
                        if temp isnt 'RETURN ' then temp += ', '

                        temp += "r.#{q}"

                    query = temp
        else if _.isString query
            query = "RETURN #{query}"
        else
            throw new Error('Unsupported type')

        @_query.push query

        return @

    using: (param, query) ->
        if param isnt 'index' or param isnt 'scan'
            query = "USING #{query}"
        else
            query = "USING #{param.toUpperCase()} #{query}"

        @_query.push query

        return @

    union: (query) ->
        if query is 'all'
            query = 'UNION ALL'
        else
            query = 'UNION'

        @_query.push query

        return @

    orderBy: (query) ->
        if _.isArray query
            temp = 'ORDER BY '

            for q in query
                if temp isnt 'ORDER BY ' then temp += ', '

                temp += "n.#{q}"

            query = temp
        else if _.isObject query
            if _.isEmpty query.r
                temp = 'ORDER BY '

                for key, value of query
                    if temp isnt 'ORDER BY ' then temp += ', '

                    temp += "n.#{key} " + if value.toUpperCase() is 'DESC' then 'DESC' else 'ASC'

                query = temp
            else
                temp = 'ORDER BY '

                for q in query
                    if temp isnt 'ORDER BY ' then temp += ', '

                    temp += "r.#{q}"

                query = temp
        else if _.isString query
            query = "ORDER BY #{query}"
        else
            throw new Error('Unsupported type')

        @_query.push query

        return @

    limit: (query) ->
        query = _.parseInt(query) or 0

        @_query.push "LIMIT #{query}"

        return @

    skip: (query) ->
        query = _.parseInt(query) or 0

        @_query.push "SKIP #{query}"

        return @

    toString: ->
        console.log @_query.join(' '), @_params
        @_query.join(' ')

    execute: (query, params) ->
        utils.post("#{@url}/db/data/cypher", {
            json:
                query: @toString()
                params: @_params
        })


module.exports =
    # ###Execute cypher query
    ###
    Without properties [Details](http://docs.neo4j.org/chunked/milestone/rest-api-nodes.html#rest-api-create-node)
    ```
    neo
    .executeCypher(
        'CREATE (n:Person { name : {name} }) RETURN n'
        {
            "name" : "Andres"
        }
    })
    ```
    ###
    executeCypher: (query, params) ->
        utils.post("#{@url}/db/data/cypher", {
            json:
                query: query
                params: params
        })

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
