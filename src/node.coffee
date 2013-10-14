utils = require './utils.coffee'

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
    .createUniqueNode('people', {
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
    createUniqueNode: (label, mode) ->
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

    # ###Get properties for node
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-node-properties.html#rest-api-get-properties-for-node)
    ```
    neo
    .getNodeProperty(1)
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    getNodeProperty: (id) ->
        utils.get("#{@url}/db/data/node/#{id}/properties")

    # ###Set property on node
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-node-properties.html#rest-api-set-property-on-node)
    ```
    neo
    .updateNodeProperty(1, 'name', 'kieve')
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    # ###Update node properties
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-node-properties.html#rest-api-update-node-properties)
    ```
    neo
    .updateNodeProperty(1, { 'name': 'kieve' })
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    updateNodeProperty: (id, property, value) ->
        if value
            url = "#{@url}/db/data/node/#{id}/properties/#{property}"
        else
            value = property
            url = "#{@url}/db/data/node/#{id}/properties"

        utils.put(url, json: value)

    # ###Delete all properties from node
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-node-properties.html#rest-api-delete-all-properties-from-node)
    ```
    neo
    .deleteNodeProperty(1)
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    # ###Delete a named property from a node
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-node-properties.html#rest-api-delete-a-named-property-from-a-node)
    ```
    neo
    .deleteNodeProperty(1, 'name')
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    deleteNodeProperty: (id, property) ->
        if property
            url = "#{@url}/db/data/node/#{id}/properties/#{property}"
        else
            url = "#{@url}/db/data/node/#{id}/properties"

        utils.del(url)

    # ###Get all nodes with a label
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-node-labels.html#rest-api-get-all-nodes-with-a-label)
    ```
    neo
    .getNodeByLabel('person')
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    # ###Get nodes by label and property
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-node-labels.html#rest-api-get-nodes-by-label-and-property)
    ```
    neo
    .getNodeByLabel('person', { name: 'kieve chua' })
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    getNodeByLabel: (label, property) ->
        if property
            return utils.get("#{@url}/db/data/label/#{label}/nodes", property)
        else
            return utils.get("#{@url}/db/data/label/#{label}/nodes")
