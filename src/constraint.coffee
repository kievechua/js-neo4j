utils = require './utils'
_ = require 'lodash'

module.exports =
    # ###Create uniqueness constraint
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-schema-constraints.html#rest-api-create-uniqueness-constraint)
    ```
    neo.createUniquenessConstraint('person', [ "name" ])
    ```
    ###
    createUniquenessConstraint: createUniquenessConstraint = (label, constraint) ->
        if _.isEmpty label then throw new Error 'Label cannot be empty'
        else if !_.isString label then throw new Error 'Label must be string'

        if _.isEmpty constraint then throw new Error 'Constraint cannot be empty'
        else if _.isPlainObject constraint then throw new Error 'Constraint must not be object'
        else if _.isString constraint then constraint = [constraint]

        utils.post(
            "#{@url}/db/data/schema/constraint/#{label}/uniqueness"
            property_keys: constraint
            (result) -> result.ok
        )
    cUniquenessConstraint: createUniquenessConstraint

    # ###read a specific uniqueness constraint
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-schema-constraints.html#rest-api-read-a-specific-uniqueness-constraint)
    ```
    neo.readUniquenessConstraint('person', 'name')
    ```
    ###
    # ###read all uniqueness constraints for a label
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-schema-constraints.html#rest-api-read-all-uniqueness-constraints-for-a-label)
    ```
    neo.readUniquenessConstraint('person')
    ```
    ###
    readUniquenessConstraint: readUniquenessConstraint = (label, property) ->
        if _.isEmpty label then throw new Error 'Label cannot be empty'
        else if !_.isString label then throw new Error 'Label must be string'

        if property
            if !_.isString property then throw new Error 'Property must be string'

            url = "#{@url}/db/data/schema/constraint/#{label}/uniqueness/#{property}"
        else
            url = "#{@url}/db/data/schema/constraint/#{label}/uniqueness"

        utils.get(url, (result) -> result.body)
    rUniquenessConstraint: readUniquenessConstraint

    # ###read all constraints for a label
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-schema-constraints.html#rest-api-read-all-constraints-for-a-label)
    ```
    neo.readConstraint('person')
    ```
    ###
    # ###read all constraints
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-schema-constraints.html#rest-api-read-all-constraints)
    ```
    neo.readConstraint()
    ```
    ###
    readConstraint: readConstraint = (label) ->
        if label
            unless _.isString label then throw new Error 'Label must be string'

            url = "#{@url}/db/data/schema/constraint/#{label}"
        else
            url = "#{@url}/db/data/schema/constraint"

        utils.get(url, (result) -> result.body)
    rConstraint: readConstraint

    # ###Drop constraint
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-schema-constraints.html#rest-api-drop-constraint)
    ```
    neo.deleteConstraint('person', 'name')
    ```
    ###
    deleteConstraint: deleteConstraint = (label, property) ->
        if _.isEmpty label then throw new Error 'Label cannot be empty'
        else if !_.isString label then throw new Error 'Label must be string'

        if _.isEmpty property then throw new Error 'Property cannot be empty'
        else if !_.isString label then throw new Error 'Property must be string'

        utils.del(
            "#{@url}/db/data/schema/constraint/#{label}/uniqueness/#{property}"
            (result) -> result.ok
        )
    dConstraint: deleteConstraint
