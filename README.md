# Neo4j REST API wrapper for Node.js

---
Under development
Not ready for production, as there's not test case yet.

## Usage
    {Neo4js} = require('neo4js')

    neo = new Neo4js()

    neo
        .queryBuilder()
        .start('*')
        .return('*')
        .execute()
        .fail((data) ->
            console.log 'error', arguments
        )
        .then((data) ->
            console.log data
        )

[Document](http://kievechua.github.io/neo4js/)

## Required

Neo4j, 2.0

## TODO
1. Test case
- Refactor
- Write more document
- Publish to NPM
- Browserify?
- Cache?
- Add feature
