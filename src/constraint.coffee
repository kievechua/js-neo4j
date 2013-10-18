utils = require './utils.coffee'

module.exports =
    # ###Create uniqueness constraint
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-schema-constraints.html#rest-api-create-uniqueness-constraint)
    ```
    neo.createUniquenessConstraint('person', [ "name" ])
    ```
    ###
    createUniquenessConstraint: createUniquenessConstraint = (label, constraint) ->
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
        if property
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
        utils.del(
            "#{@url}/db/data/schema/constraint/#{label}/uniqueness/#{property}"
            (result) -> result.ok
        )
    dConstraint: deleteConstraint
