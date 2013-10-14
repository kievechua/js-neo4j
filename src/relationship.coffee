utils = require './utils.coffee'

module.exports =
    # ###Get all relationships
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationship-types.html)
    ```
    neo
    .getRelationshipType()
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    getRelationshipType: ->
        utils.get("#{@url}/db/data/relationship/types")

    # ###Get all relationships
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-get-all-relationships)
    ```
    neo
    .getRelationship(1, 'all')
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    # ###Get outgoing relationships
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-get-incoming-relationships)
    ```
    neo
    .getRelationship(1, 'out')
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    # ###Get incoming relationships
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-get-incoming-relationships)
    ```
    neo
    .getRelationship(1, 'in')
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    # ###Get Relationship by ID
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-get-relationship-by-id)
    ```
    neo
    .getRelationship(1)
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    getRelationship: (nodeId, type) ->
        if type is 'all' or type is 'in' or type is 'out'
            url = utils.get("#{@url}/db/data/node/#{nodeId}/relationships/#{type}")
        else
            url = "#{@url}/db/data/relationship/#{nodeId}"

        utils.get(url)

    # ###Get typed relationships
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-get-typed-relationships)
    ```
    neo
    .getTypedRelationship(1, ['LIKES', 'HATES'])
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    getTypedRelationship: (nodeId, types = []) ->
        types = types.join('%26')
        utils.get("#{@url}/db/data/node/#{nodeId}/relationships/all/#{types}")

    # ###Get or create unique relationship (create)
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-nodes.html#rest-api-create-node)
    ```
    neo
    .createUniqueRelationship('people', {
        "key" : "name",
        "value" : "Tobias",
        "start" : "http://localhost:7474/db/data/node/435",
        "end" : "http://localhost:7474/db/data/node/436",
        "type" : "knowledge"
    })
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    createUniqueRelationship: (label, mode) ->
        utils.post("#{@url}/db/data/index/relationship/#{label}?uniqueness=#{mode}", json: params)

    # ###Create relationship
    # Upon successful creation of a relationship, the new relationship is returned.
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-create-relationship)
    ```
    neo
    .createRelationship(1, 2, 'love', { foo: bar })
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    createRelationship: (fromNodeId, toNodeId, type, properties) ->
        params =
            to: "#{@url}/db/data/node/#{toNodeId}"
            type: type
            data: properties

        utils.post("#{@url}/db/data/node/#{fromNodeId}/relationships", params)

    # ###Delete relationship
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-delete-relationship)
    ```
    neo
    .deleteRelationship(1)
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    deleteRelationship: (id) ->
        utils.del("#{@url}/db/data/relationship/#{id}", params)

    # ###Get all properties on a relationship
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-get-all-properties-on-a-relationship)
    ```
    neo
    .getRelationshipProperty(1)
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    # ###Get all properties on a relationship
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-get-all-properties-on-a-relationship)
    ```
    neo
    .getRelationshipProperty(1, 'cost')
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    getRelationshipProperty: (id, property) ->
        if property
            url = "#{@url}/db/data/relationship/#{id}/properties/#{property}"
        else
            url = "#{@url}/db/data/relationship/#{id}/properties"

        utils.get(url)

    # ###Set single property on a relationship
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-set-single-property-on-a-relationship)
    ```
    neo
    .updateRelationshipProperty(1, 'happy', 'yes')
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    # ###Update relationship properties
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationship-properties.html#rest-api-update-relationship-properties)
    ```
    neo
    .updateRelationshipProperty(1, { age: 18 })
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    # ###Set all properties on a relationship
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-set-all-properties-on-a-relationship)
    ```
    neo
    .updateRelationshipProperty(1, { happy: 'yes' })
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    updateRelationshipProperty: (id, property, value) ->
        if value
            url = "#{@url}/db/data/relationship/#{id}/properties/#{property}"
        else
            value = property
            url = "#{@url}/db/data/relationship/#{id}/properties"

        utils.put(url, json: value)

    # ###Remove properties from a relationship
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationship-properties.html#rest-api-remove-properties-from-a-relationship)
    ```
    neo
    .deleteRelationshipProperty(1)
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    # ###Remove property from a relationship
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationship-properties.html#rest-api-remove-property-from-a-relationship)
    ```
    neo
    .deleteRelationshipProperty(1, 'cost')
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    deleteRelationshipProperty: (id, property) ->
        if property
            url = "#{@url}/db/data/relationship/#{id}/properties/#{property}"
        else
            url = "#{@url}/db/data/relationship/#{id}/properties"

        utils.del(url)
