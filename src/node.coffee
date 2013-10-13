utils = require './utils.coffee'
request = require 'request'
Q = require 'q'

module.exports =
    # ###Create node
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
    .createNode({
      name: 'Kieve'
    })
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    createNode: (params) ->
        utils.post("#{@url}/db/data/node", json: params)

    # ###Get or create unique node (create)
    ###
    ```
    neo
    .uniqueNode('people', {
        "key" : "name",
        "value" : "Tobias",
        "properties" : {
            "name" : "Tobias",
            "sequence" : 1
        }
    })
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    uniqueNode: (label, mode) ->
        utils.post("#{@url}/db/data/index/node/#{label}?uniqueness=#{mode}", json: params)

    # ###Get node
    # Note that the response contains URI/templates for the available operations for getting properties and relationships.
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-nodes.html#rest-api-get-node)
    ```
    neo
    .getNode(1)
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    getNode: (id) ->
        utils.get("#{@url}/db/data/node/#{id}")

    # ###Delete node
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-nodes.html#rest-api-delete-node)
    ```
    neo
    .deleteNode(1)
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    deleteNode: (id) ->
        utils.del("#{@url}/db/data/node/#{id}")

    getNodeProperties: (id) ->
        deferred = Q.defer()
        request.get("#{@url}/db/data/node/#{id}/properties", (err, res, body) ->
            if err or not body
                deferred.reject err
            else
                deferred.resolve body
        )
        deferred.promise
    setNodeProperty: (id, property, value) ->
        deferred = Q.defer()
        request.put("#{@url}/db/data/node/#{id}/properties/#{property}", json: value, (err, res, body) ->
            if err
                deferred.reject err
            else if res.statusCode >= 400
                deferred.reject res.body
            else
                deferred.resolve 'success'
        )
        deferred.promise
    updateNodeProperties: (id, params) ->
        deferred = Q.defer()
        request.put("#{@url}/db/data/node/#{id}/properties", json: params, (err, res, body) ->
            if err
                deferred.reject err
            else if res.statusCode >= 400
                deferred.reject res.body
            else
                deferred.resolve 'success'
        )
        deferred.promise
    deleteNodeProperties: (id) ->
        deferred = Q.defer()
        request.del("#{@url}/db/data/node/#{id}/properties", (err, res, body) ->
            if err
                deferred.reject err
            else if res.statusCode >= 400
                deferred.reject res.body
            else
                deferred.resolve 'success'
        )
        deferred.promise
    deleteNodeProperty: (id, property) ->
        deferred = Q.defer()
        request.del("#{@url}/db/data/node/#{id}/properties/#{property}", (err, res, body) ->
            if err
                deferred.reject err
            else if res.statusCode >= 400
                deferred.reject res.body
            else
                deferred.resolve 'success'
        )
        deferred.promise
