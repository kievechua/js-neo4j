utils = require './utils.coffee'
request = require 'request'
Q = require 'q'

module.exports =
    getRelationshipTypes: ->
        deferred = Q.defer()
        request.get("#{@url}/db/data/relationship/types", (err, res, body) ->
            if err or not body
                deferred.reject err
            else
                deferred.resolve body
        )
        deferred.promise

    # ###Get all relationships
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-get-all-relationships)
    ```
    neo
    .getRelationships(1)
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    getRelationships: (nodeId) ->
        utils.get("#{@url}/db/data/node/#{nodeId}/relationships/all")

    # ###Get outgoing relationships
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-get-incoming-relationships)
    ```
    neo
    .getIncomingRelationships(1)
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    getOutgoingRelationships: (nodeId) ->
        utils.get("#{@url}/db/data/node/#{nodeId}/relationships/out")

    # ###Get or create unique relationship (create)
    ###
    Without properties [Details](http://docs.neo4j.org/chunked/milestone/rest-api-nodes.html#rest-api-create-node)
    ```
    neo
    .createNode()
    .then(...)
    .fail(...)
    .done(...)
    ```
    With properties [Details](http://docs.neo4j.org/chunked/milestone/rest-api-nodes.html#rest-api-create-node-with-properties)
    ```
    neo
    .uniqueRelationship('people', {
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
    uniqueRelationship: (label, mode) ->
        utils.post("#{@url}/db/data/index/relationship/#{label}?uniqueness=#{mode}", json: params)

    # ###Get typed relationships
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-get-typed-relationships)
    ```
    neo
    .getTypedRelationships(1, ['LIKES', 'HATES'])
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    getTypedRelationships: (nodeId, types = []) ->
        types = types.join('%26')
        utils.get("#{@url}/db/data/node/#{nodeId}/relationships/all/#{types}")

    # ###Get incoming relationships
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-get-incoming-relationships)
    ```
    neo
    .getIncomingRelationships(1)
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    getIncomingRelationships: (nodeId) ->
        utils.get("#{@url}/db/data/node/#{nodeId}/relationships/in")

    # ###Get Relationship by ID
    # Note that the response contains URI/templates for the available operations for getting properties and relationships.
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
    getRelationship: (id) ->
        utils.get("#{@url}/db/data/relationship/#{id}")

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
    createRelationship: (fromId, toId, type, properties) ->
        params =
            to: "#{@url}/db/data/node/#{toId}"
            type: type
            data: properties

        utils.post("#{@url}/db/data/node/#{fromId}/relationships", params)

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
    .getRelationshipProperties(1)
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    getRelationshipProperties: (id) ->
        utils.get("#{@url}/db/data/relationship/#{id}/properties")

    # ###Set all properties on a relationship
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-set-all-properties-on-a-relationship)
    ```
    neo
    .setRelationshipProperties(1, { happy: 'yes' })
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    setRelationshipProperties: (id, params) ->
        utils.put("#{@url}/db/data/relationship/#{id}/properties", json: params)

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
        utils.get("#{@url}/db/data/relationship/#{id}/properties/#{property}")

    # ###Set single property on a relationship
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-relationships.html#rest-api-set-single-property-on-a-relationship)
    ```
    neo
    .setRelationshipProperty(1, 'happy', 'yes')
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    setRelationshipProperty: (id, property, value) ->
        utils.put("#{@url}/db/data/relationship/#{id}/properties/#{property}", json: value)

    updateRelationshipProperties: (id, params) ->
        deferred = Q.defer()
        request.put("#{@url}/db/data/relationship/#{id}/properties", json: params, (err, res, body) ->
            if err
                deferred.reject err
            else if res.statusCode >= 400
                deferred.reject res.body
            else
                deferred.resolve 'success'
        )
        deferred.promise
    deleteRelationshipProperties: (id) ->
        deferred = Q.defer()
        request.del("#{@url}/db/data/relationship/#{id}/properties", (err, res, body) ->
            if err
                deferred.reject err
            else if res.statusCode >= 400
                deferred.reject res.body
            else
                deferred.resolve 'success'
        )
        deferred.promise
    deleteRelationshipProperty: (id, property) ->
        deferred = Q.defer()
        request.del("#{@url}/db/data/relationship/#{id}/properties/#{property}", (err, res, body) ->
            if err
                deferred.reject err
            else if res.statusCode >= 400
                deferred.reject res.body
            else
                deferred.resolve 'success'
        )
        deferred.promise
