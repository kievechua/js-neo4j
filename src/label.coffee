utils = require './utils.coffee'

module.exports =
    # ###Listing labels for a node
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-node-labels.html#rest-api-listing-labels-for-a-node)
    ```
    neo
    .readLabel(1)
    ```
    ###
    # ###List all labels
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-node-labels.html#rest-api-list-all-labels)
    ```
    neo
    .readLabel()
    ```
    ###
    readLabel: readLabel = (nodeId) ->
        if nodeId
            url = "#{@url}/db/data/node/#{nodeId}/labels"
        else
            url = "#{@url}/db/data/labels"

        utils.get(url)
    rLabel: readLabel

    # ###Adding a label to a node
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-node-labels.html#rest-api-adding-a-label-to-a-node)
    ```
    neo
    .createLabel(1, 'person')
    ```
    ###
    # ###Adding a label to a node
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-node-labels.html#rest-api-adding-multiple-labels-to-a-node)
    ```
    neo
    .createLabel(1, ['person', 'programmer'])
    ```
    ###
    createLabel: createLabel = (nodeId, label) ->
        utils.post("#{@url}/db/data/node/#{nodeId}/labels", json: label)
    cLabel: createLabel

    # ###Replacing labels on a node
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-node-labels.html#rest-api-replacing-labels-on-a-node)
    ```
    neo
    .updateLabel(1, 'person')
    ```
    ###
    updateLabel: updateLabel = (nodeId, labels) ->
        utils.put("#{@url}/db/data/node/#{nodeId}/labels", json: labels)
    uLabel: updateLabel

    # ###Removing a label from a node
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-node-labels.html#rest-api-replacing-labels-on-a-node)
    ```
    neo
    .deleteLabel(1, 'person')
    ```
    ###
    deleteLabel: deleteLabel = (nodeId, label) ->
        utils.del("#{@url}/db/data/node/#{nodeId}/labels/#{label}")
    dLabel: deleteLabel
