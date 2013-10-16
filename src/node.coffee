utils = require './utils.coffee'

module.exports =
    # ###Create node
    ###
    Without properties [Details](http://docs.neo4j.org/chunked/milestone/rest-api-nodes.html#rest-api-create-node)
    ```
    neo
    .createNode()
    ```
    With properties [Details](http://docs.neo4j.org/chunked/milestone/rest-api-nodes.html#rest-api-create-node-with-properties)
    ```
    neo
    .createNode({
      name: 'Kieve'
    })
    ```
    ###
    createNode: createNode = (params) ->
        utils.post("#{@url}/db/data/node", params, (node) ->
            id = node.body.self.split('/')
            id = id[id.length - 1]
            node.body.data._id = id

            return node.body.data
        )
    cNode: createNode

    # Dropping this in favour of Constraint
    # ###read or create unique node (create)
    ###
    ```
    neo.createUniqueNode('people', 'name', 'Kieve', { age: 18 }, 'create_or_fail')
    ```
    ###
    # createUniqueNode: createUniqueNode = (label, key, value, params, mode = "get_or_create") ->
    #     utils.post(
    #         "#{@url}/db/data/index/node/#{label}?uniqueness=#{mode}",
    #         {
    #             key: key
    #             value:  value
    #             properties: params
    #         },
    #         (node) ->
    #             id = node.body.self.split('/')
    #             id = id[id.length - 1]
    #             node.body.data._id = id

    #             return node.body.data
    #     )
    # cUniqueNode: createUniqueNode

    # ###read node
    # Note that the response contains URI/templates for the available operations for readting properties and relationships.
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-nodes.html#rest-api-read-node)
    ```
    neo
    .readNode(1)
    ```
    ###
    readNode: readNode = (nodeId) ->
        utils.get(
            "#{@url}/db/data/node/#{nodeId}",
            (node) ->
                id = node.body.self.split('/')
                id = id[id.length - 1]
                node.body.data._id = id

                return node.body.data
        )
    rNode: readNode

    # ###Delete node
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-nodes.html#rest-api-delete-node)
    ```
    neo
    .deleteNode(1)
    ```
    ###
    deleteNode: deleteNode = (nodeId) ->
        utils.del("#{@url}/db/data/node/#{nodeId}")
    dNode: deleteNode

    # ###read properties for node
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-node-properties.html#rest-api-read-properties-for-node)
    ```
    neo
    .readNodeProperty(1)
    ```
    ###
    readNodeProperty: readNodeProperty = (nodeId) ->
        utils.get(
            "#{@url}/db/data/node/#{nodeId}/properties",
            (node) ->
                node.body._id = nodeId

                return node.body
        )
    rNodeProperty: readNodeProperty

    # ###Set property on node
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-node-properties.html#rest-api-set-property-on-node)
    ```
    neo
    .updateNodeProperty(1, 'name', 'kieve')
    ```
    ###
    # ###Update node properties
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-node-properties.html#rest-api-update-node-properties)
    ```
    neo
    .updateNodeProperty(1, { 'name': 'kieve' })
    ```
    ###
    updateNodeProperty: updateNodeProperty = (nodeId, property, value) ->
        if value
            value = JSON.stringify(value)
            url = "#{@url}/db/data/node/#{nodeId}/properties/#{property}"
        else
            value = property
            url = "#{@url}/db/data/node/#{nodeId}/properties"

        utils.put(
            url,
            value,
            (node) -> node.ok
        )
    uNodeProperty: updateNodeProperty

    # ###Delete all properties from node
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-node-properties.html#rest-api-delete-all-properties-from-node)
    ```
    neo
    .deleteNodeProperty(1)
    ```
    ###
    # ###Delete a named property from a node
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-node-properties.html#rest-api-delete-a-named-property-from-a-node)
    ```
    neo
    .deleteNodeProperty(1, 'name')
    ```
    ###
    deleteNodeProperty: deleteNodeProperty = (nodeId, property) ->
        if property
            url = "#{@url}/db/data/node/#{nodeId}/properties/#{property}"
        else
            url = "#{@url}/db/data/node/#{nodeId}/properties"

        utils.del(url)
    dNodeProperty: deleteNodeProperty

    # ###read all nodes with a label
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-node-labels.html#rest-api-read-all-nodes-with-a-label)
    ```
    neo
    .readNodeByLabel('person')
    ```
    ###
    # ###read nodes by label and property
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-node-labels.html#rest-api-read-nodes-by-label-and-property)
    ```
    neo
    .readNodeByLabel('person', { name: 'kieve chua' })
    ```
    ###
    readNodeByLabel: readNodeByLabel = (label, property) ->
        if property
            return utils.get("#{@url}/db/data/label/#{label}/nodes", property)
        else
            return utils.get("#{@url}/db/data/label/#{label}/nodes")
    rNodeByLabel: readNodeByLabel
