utils = require './utils'

module.exports =
    # ###Create index
    ###
    neo.createIndex('user', [ 'name' ])
    ###
    createIndex: createIndex = (index, params) ->
        utils.post(
            "#{@url}/db/data/schema/index/#{index}",
            property_keys: params,
            (result) -> result.body
        )
    cIndex: createIndex

    # ###List indexes for a label
    ###
    neo.readIndex('user')
    ###
    readIndex: readIndex = (label) ->
        utils.get("#{@url}/db/data/schema/index/#{label}", (result) -> result.body)
    rIndex: readIndex

    # ###Drop index
    ###
    neo.deleteIndex('user', 'name')
    ###
    deleteIndex: deleteIndex = (label, property) ->
        utils.del("#{@url}/db/data/schema/index/#{label}/#{property}", (result) -> result.ok)
    dIndex: deleteIndex
