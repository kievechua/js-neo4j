utils = require './utils.coffee'

module.exports =
    # ###read all relationships
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationship-types.html)
    ```
    neo
    .readRelationshipType()
    ```
    ###
    readRelationshipType: readRelationshipType = ->
        utils.get("#{@url}/db/data/relationship/types")
    rRelationshipType: readRelationshipType

    # ###read all relationships
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-read-all-relationships)
    ```
    neo
    .readRelationship(1, 'all')
    ```
    ###
    # ###read outgoing relationships
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-read-incoming-relationships)
    ```
    neo
    .readRelationship(1, 'out')
    ```
    ###
    # ###read incoming relationships
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-read-incoming-relationships)
    ```
    neo
    .readRelationship(1, 'in')
    ```
    ###
    # ###read Relationship by ID
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-read-relationship-by-id)
    ```
    neo
    .readRelationship(1)
    ```
    ###
    readRelationship: readRelationship = (nodeId, type) ->
        if type is 'all' or type is 'in' or type is 'out'
            url = utils.get("#{@url}/db/data/node/#{nodeId}/relationships/#{type}")
        else
            url = "#{@url}/db/data/relationship/#{nodeId}"

        utils.get(url)
    rRelationship: readRelationship

    # ###read typed relationships
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-read-typed-relationships)
    ```
    neo
    .readTypedRelationship(1, ['LIKES', 'HATES'])
    ```
    ###
    readTypedRelationship: readTypedRelationship = (nodeId, types = []) ->
        types = types.join('%26')
        utils.get("#{@url}/db/data/node/#{nodeId}/relationships/all/#{types}")
    rTypedRelationship: readTypedRelationship

    # ###read or create unique relationship (create)
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
    ```
    ###
    createUniqueRelationship: createUniqueRelationship = (label, mode) ->
        utils.post("#{@url}/db/data/index/relationship/#{label}?uniqueness=#{mode}", json: params)
    cUniqueRelationship: createUniqueRelationship

    # ###Create relationship
    # Upon successful creation of a relationship, the new relationship is returned.
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-create-relationship)
    ```
    neo
    .createRelationship(1, 2, 'love', { foo: bar })
    ```
    ###
    createRelationship: createRelationship = (fromNodeId, toNodeId, type, properties) ->
        params =
            to: "#{@url}/db/data/node/#{toNodeId}"
            type: type
            data: properties

        utils.post("#{@url}/db/data/node/#{fromNodeId}/relationships", params)
    cRelationship: createRelationship

    # ###Delete relationship
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-delete-relationship)
    ```
    neo
    .deleteRelationship(1)
    ```
    ###
    deleteRelationship: deleteRelationship = (id) ->
        utils.del("#{@url}/db/data/relationship/#{id}", params)
    dRelationship: deleteRelationship

    # ###read all properties on a relationship
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-read-all-properties-on-a-relationship)
    ```
    neo
    .readRelationshipProperty(1)
    ```
    ###
    # ###read all properties on a relationship
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-read-all-properties-on-a-relationship)
    ```
    neo
    .readRelationshipProperty(1, 'cost')
    ```
    ###
    readRelationshipProperty: readRelationshipProperty = (id, property) ->
        if property
            url = "#{@url}/db/data/relationship/#{id}/properties/#{property}"
        else
            url = "#{@url}/db/data/relationship/#{id}/properties"

        utils.get(url)
    rRelationshipProperty: readRelationshipProperty

    # ###Set single property on a relationship
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-set-single-property-on-a-relationship)
    ```
    neo
    .updateRelationshipProperty(1, 'happy', 'yes')
    ```
    ###
    # ###Update relationship properties
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationship-properties.html#rest-api-update-relationship-properties)
    ```
    neo
    .updateRelationshipProperty(1, { age: 18 })
    ```
    ###
    # ###Set all properties on a relationship
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-set-all-properties-on-a-relationship)
    ```
    neo
    .updateRelationshipProperty(1, { happy: 'yes' })
    ```
    ###
    updateRelationshipProperty: updateRelationshipProperty = (id, property, value) ->
        if value
            url = "#{@url}/db/data/relationship/#{id}/properties/#{property}"
        else
            value = property
            url = "#{@url}/db/data/relationship/#{id}/properties"

        utils.put(url, json: value)
    uRelationshipProperty: updateRelationshipProperty

    # ###Remove properties from a relationship
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationship-properties.html#rest-api-remove-properties-from-a-relationship)
    ```
    neo
    .deleteRelationshipProperty(1)
    ```
    ###
    # ###Remove property from a relationship
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationship-properties.html#rest-api-remove-property-from-a-relationship)
    ```
    neo
    .deleteRelationshipProperty(1, 'cost')
    ```
    ###
    deleteRelationshipProperty: deleteRelationshipProperty = (id, property) ->
        if property
            url = "#{@url}/db/data/relationship/#{id}/properties/#{property}"
        else
            url = "#{@url}/db/data/relationship/#{id}/properties"

        utils.del(url)
    dRelationshipProperty: deleteRelationshipProperty
