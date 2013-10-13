request = require 'request'
Q = require 'q'

module.exports =
    createUniquenessConstraint: (label, constraint) ->
        deferred = Q.defer()
        request.post(
            "#{@url}/db/data/schema/constraint/#{label}/uniqueness"
            json:
                property_keys: constraint
            (err, res, body) ->
                if err or not body
                    deferred.reject err
                else
                    deferred.resolve body
        )
        deferred.promise
    getUniquenessConstraint: (label, property) ->
        deferred = Q.defer()
        request.get(
            "#{@url}/db/data/schema/constraint/#{label}/uniqueness/#{property}"
            (err, res, body) ->
                if err or not body
                    deferred.reject err
                else
                    deferred.resolve body
        )
        deferred.promise
    getUniquenessConstraints: (label) ->
        deferred = Q.defer()
        request.get(
            "#{@url}/db/data/schema/constraint/#{label}/uniqueness"
            (err, res, body) ->
                if err or not body
                    deferred.reject err
                else
                    deferred.resolve body
        )
        deferred.promise
    getLabelConstraints: (label) ->
        deferred = Q.defer()
        request.get(
            "#{@url}/db/data/schema/constraint/#{label}"
            (err, res, body) ->
                if err or not body
                    deferred.reject err
                else
                    deferred.resolve body
        )
        deferred.promise
    getConstraints: ->
        deferred = Q.defer()
        request.get(
            "#{@url}/db/data/schema/constraint"
            (err, res, body) ->
                if err or not body
                    deferred.reject err
                else
                    deferred.resolve body
        )
        deferred.promise
    deleteConstraint: (label, property) ->
        deferred = Q.defer()
        request.get(
            "#{@url}/db/data/schema/constraint/#{label}/uniqueness/#{property}"
            (err, res, body) ->
                if err or not body
                    deferred.reject err
                else
                    deferred.resolve body
        )
        deferred.promise
