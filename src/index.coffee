utils = require './utils.coffee'

module.exports =
    createIndex: (index, params) ->
        utils.post("#{@url}/db/data/schema/index/#{index}", json: params)

    getIndex: (label) ->
        utils.get("#{@url}/db/data/schema/index/#{label}")

    deleteIndex: (label, property) ->
        utils.del("#{@url}/db/data/schema/index/#{label}/#{property}", json: params)
