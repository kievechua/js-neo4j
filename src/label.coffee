request = require 'request'
Q = require 'q'

module.exports =
    getNodeByLabel: (label) ->
        deferred = Q.defer()
        request.get("#{@url}/db/data/label/#{label}/nodes", (err, res, body) ->
            if err or not body
                deferred.reject err
            else
                deferred.resolve body
        )
        deferred.promise
    getNodeByLabelAndProperty: (label, property) ->
        deferred = Q.defer()
        request.get("#{@url}/db/data/label/#{label}/nodes", json: property, (err, res, body) ->
            if err or not body
                deferred.reject err
            else
                deferred.resolve body
        )
        deferred.promise
    getNodeLabels: (nodeId) ->
        deferred = Q.defer()
        request.get("#{@url}/db/data/node/#{nodeId}/labels", (err, res, body) ->
            if err or not body
                deferred.reject err
            else
                deferred.resolve body
        )
        deferred.promise
    getLabels: ->
        deferred = Q.defer()
        request.get("#{@url}/db/data/labels", (err, res, body) ->
            if err or not body
                deferred.reject err
            else
                deferred.resolve body
        )
        deferred.promise
    addLabel: (nodeId, label) ->
        deferred = Q.defer()
        request.post("#{@url}/db/data/node/#{nodeId}/labels", json: label, (err, res, body) ->
            if err or not body
                deferred.reject err
            else
                deferred.resolve body
        )
        deferred.promise
    addLabels: (nodeId, labels) ->
        deferred = Q.defer()
        request.post("#{@url}/db/data/node/#{nodeId}/labels", json: labels, (err, res, body) ->
            if err or not body
                deferred.reject err
            else
                deferred.resolve body
        )
        deferred.promise
    replaceLabels: (nodeId, labels) ->
        deferred = Q.defer()
        request.put("#{@url}/db/data/node/#{nodeId}/labels", json: labels, (err, res, body) ->
            if err or not body
                deferred.reject err
            else
                deferred.resolve body
        )
        deferred.promise
    deleteLabel: (nodeId, label) ->
        deferred = Q.defer()
        request.del("#{@url}/db/data/node/#{nodeId}/labels/#{label}", (err, res, body) ->
            if err or not body
                deferred.reject err
            else
                deferred.resolve body
        )
        deferred.promise
