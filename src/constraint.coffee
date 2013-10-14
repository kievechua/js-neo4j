utils = require './utils.coffee'

module.exports =
    # ###Create uniqueness constraint
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-schema-constraints.html#rest-api-create-uniqueness-constraint)
    ```
    neo
    .createUniquenessConstraint('person', [ "name" ])
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    createUniquenessConstraint: (label, constraint) ->
        utils.post(
            "#{@url}/db/data/schema/constraint/#{label}/uniqueness"
            json:
                property_keys: constraint
        )

    # ###Get a specific uniqueness constraint
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-schema-constraints.html#rest-api-get-a-specific-uniqueness-constraint)
    ```
    neo
    .getUniquenessConstraint('person', 'name')
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    # ###Get all uniqueness constraints for a label
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-schema-constraints.html#rest-api-get-all-uniqueness-constraints-for-a-label)
    ```
    neo
    .getUniquenessConstraint('person')
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    getUniquenessConstraint: (label, property) ->
        if property
            url = "#{@url}/db/data/schema/constraint/#{label}/uniqueness/#{property}"
        else
            url = "#{@url}/db/data/schema/constraint/#{label}/uniqueness"

        utils.get(url)

    # ###Get all constraints for a label
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-schema-constraints.html#rest-api-get-all-constraints-for-a-label)
    ```
    neo
    .getConstraint('person')
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    # ###Get all constraints
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-schema-constraints.html#rest-api-get-all-constraints)
    ```
    neo
    .getConstraint()
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    getConstraint: (label) ->
        if label
            url = "#{@url}/db/data/schema/constraint/#{label}"
        else
            url = "#{@url}/db/data/schema/constraint"

        utils.get(url)

    # ###Drop constraint
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-schema-constraints.html#rest-api-drop-constraint)
    ```
    neo
    .deleteConstraint('peerson', 'name')
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    deleteConstraint: (label, property) ->
        utils.get(
            "#{@url}/db/data/schema/constraint/#{label}/uniqueness/#{property}"
        )
