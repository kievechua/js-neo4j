_ = require 'lodash'
request = require 'superagent'
Q = require 'q'

moduleKeywords = ['extended', 'included']

errorHandler = (deferred, err, body, success) ->
    if err
        deferred.reject err
    else if body.statusCode >= 400
        deferred.reject {
            statusCode: body.statusCode
            message: body.body
        }
    else if success
        deferred.resolve success(body)
    else
        deferred.resolve body

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

    objToStr: (obj) ->
        query = '{ '

        _.forOwn obj, (value, key) ->
            if query isnt '{ ' then query += ', '

            query += "#{key} : '#{value}'"

        query += ' }'

    # Wrap GET request with promise
    get: (url, query, success) ->
        deferred = Q.defer()

        if _.isFunction query
            success = query

            request
                .get(url)
                .type('json')
                .end((err, body) ->
                    errorHandler deferred, err, body, success
                )
        else
            request
                .get(url)
                .type('json')
                .query(query)
                .end((err, body) ->
                    errorHandler deferred, err, body, success
                )

        deferred.promise

    # Wrap POST request with promise
    post: (url, params, success) ->
        deferred = Q.defer()

        request
            .post(url)
            .type('json')
            .send(params)
            .end((err, body) ->
                errorHandler deferred, err, body, success
            )

        deferred.promise

    # Wrap PUT request with promise
    put: (url, params, success) ->
        deferred = Q.defer()

        request
            .put(url)
            .type('json')
            .send(params)
            .end((err, body) ->
                errorHandler deferred, err, body, success
            )

        deferred.promise

    # Wrap Delete request with promise
    del: (url, success) ->
        deferred = Q.defer()

        request
            .del(url)
            .end((err, body) ->
                errorHandler deferred, err, body, success
            )

        deferred.promise
