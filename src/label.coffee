utils = require './utils.coffee'

module.exports =
    # ###Listing labels for a node
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-node-labels.html#rest-api-listing-labels-for-a-node)
    ```
    neo
    .getLabel(1)
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    # ###List all labels
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-node-labels.html#rest-api-list-all-labels)
    ```
    neo
    .getLabel()
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    getLabel: (nodeId) ->
        if nodeId
            url = "#{@url}/db/data/node/#{nodeId}/labels"
        else
            url = "#{@url}/db/data/labels"

        utils.get(url)

    # ###Adding a label to a node
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-node-labels.html#rest-api-adding-a-label-to-a-node)
    ```
    neo
    .addLabel(1, 'person')
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    # ###Adding a label to a node
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-node-labels.html#rest-api-adding-multiple-labels-to-a-node)
    ```
    neo
    .addLabel(1, ['person', 'programmer'])
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    addLabel: (nodeId, label) ->
        utils.post("#{@url}/db/data/node/#{nodeId}/labels", json: label)

    # ###Replacing labels on a node
    ###
    [Details](http://docs.neo4j.org/chunked/milestone/rest-api-node-labels.html#rest-api-replacing-labels-on-a-node)
    ```
    neo
    .updateLabel(1, 'person')
    .then(...)
    .fail(...)
    .done(...)
    ```
    ###
    updateLabel: (nodeId, labels) ->
        utils.put("#{@url}/db/data/node/#{nodeId}/labels", json: labels)

    deleteLabel: (nodeId, label) ->
        utils.del("#{@url}/db/data/node/#{nodeId}/labels/#{label}")
