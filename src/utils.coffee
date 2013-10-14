request = require 'superagent'
Q = require 'q'

moduleKeywords = ['extended', 'included']

module.exports =
    # ###Provide mixin and extand classes
    # [Little book](http://arcturo.github.io/library/coffeescript/03_classes.html)
    Module: class Module
        @extend: (obj) ->
            for key, value of obj when key not in moduleKeywords
                @[key] = value

            obj.extended?.apply(@)
            this
        @include: (obj) ->
            for key, value of obj when key not in moduleKeywords
                # Assign properties to the prototype
                @::[key] = value

            obj.included?.apply(@)
            this

    # Wrap GET request with promise
    get: (url) ->
        deferred = Q.defer()

        request
            .get(url)
            .type('json')
            .query(params)
            .end((err, body) ->
                if err or not body
                    deferred.reject err
                else
                    deferred.resolve body
            )

        deferred.promise

    # Wrap POST request with promise
    post: (url, params) ->
        deferred = Q.defer()

        request
            .post(url)
            .type('json')
            .send(params)
            .end((err, body) ->
                if err or not body
                    deferred.reject err
                else
                    deferred.resolve body
            )

        deferred.promise

    # Wrap PUT request with promise
    put: (url, params) ->
        deferred = Q.defer()

        request
            .put(url)
            .type('json')
            .send(params)
            .end((err, body) ->
                if err or not body
                    deferred.reject err
                else
                    deferred.resolve body
            )

        deferred.promise

    # Wrap Delete request with promise
    del: (url) ->
        deferred = Q.defer()

        request
            .del(url)
            .end((err, body) ->
                if err or not body
                    deferred.reject err
                else
                    deferred.resolve body
            )

        deferred.promise
