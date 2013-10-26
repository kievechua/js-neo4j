# Neo4j REST API wrapper for Node.js

---
## Installation
`npm install js-neo4j`

## Usage
    {Neo4js} = require('js-neo4j')

    neo = new Neo4js()

    neo
        .createNode()
        .then((data) ->
            console.log data
        )
        .fail((data) ->
            console.log 'error', arguments
        )

    neo
        .queryBuilder()
        .start('*')
        .return('*')
        .execute()
        .then((data) ->
            console.log data
        )
        .fail((data) ->
            console.log 'error', arguments
        )

Check out [api document](http://kievechua.github.io/js-neo4j/)

Or [test generator document](http://kievechua.github.io/js-neo4j/doc/test/test.html)

All Neo4js CRUB interface come with little shorthand

```
neo.createNode() = neo.cNode()
neo.readNode() = neo.rNode()
neo.updateNodeProperty() = neo.uNodeProperty()
neo.deleteNode() = neo.dNode()
// And etc
```
## Development
1. Start Neo4j server
2. Run `npm test`

## Required

Neo4j, 2.0

## TODO
1. Cypher sanitization
- Cover remaining api
- More documentation
- Integrate with Travis CI
- Browserify?
- Cache?
