request = require 'request'
Q = require 'q'

module.exports =
    createIndex: (index, params) ->
        deferred = Q.defer()
        request.post("#{@url}/db/data/schema/index/#{index}", json: params, (err, res, body) ->
            if err or not body
                deferred.reject err
            else
                deferred.resolve body
        )
        deferred.promise
    getIndex: (label) ->
        deferred = Q.defer()
        request.get("#{@url}/db/data/schema/index/#{label}", (err, res, body) ->
            if err or not body
                deferred.reject err
            else
                deferred.resolve body
        )
        deferred.promise
    deleteIndex: (label, property) ->
        deferred = Q.defer()
        request.del("#{@url}/db/data/schema/index/#{label}/#{property}", json: params, (err, res, body) ->
            if err or not body
                deferred.reject err
            else
                deferred.resolve body
        )
        deferred.promise
