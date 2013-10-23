# TOC
   - [Algorithm](#algorithm)
     - [neo.findPath(nodeId, {parameters})](#algorithm-neofindpathnodeid-parameters)
       - [when valid](#algorithm-neofindpathnodeid-parameters-when-valid)
   - [Batch](#batch)
     - [neo.executeBatch([tasks])](#batch-neoexecutebatchtasks)
       - [when valid](#batch-neoexecutebatchtasks-when-valid)
   - [Constraint](#constraint)
     - [neo.createUniquenessConstraint(label, [property])](#constraint-neocreateuniquenessconstraintlabel-property)
       - [when valid](#constraint-neocreateuniquenessconstraintlabel-property-when-valid)
     - [neo.readConstraint()](#constraint-neoreadconstraint)
       - [when valid](#constraint-neoreadconstraint-when-valid)
     - [neo.readUniquenessConstraint(label, property)](#constraint-neoreaduniquenessconstraintlabel-property)
       - [when valid](#constraint-neoreaduniquenessconstraintlabel-property-when-valid)
     - [neo.deleteConstraint(label, property)](#constraint-neodeleteconstraintlabel-property)
       - [when valid](#constraint-neodeleteconstraintlabel-property-when-valid)
   - [Cypher](#cypher)
     - [neo.executeCypher(query, parameters)](#cypher-neoexecutecypherquery-parameters)
       - [when valid](#cypher-neoexecutecypherquery-parameters-when-valid)
     - [neo.queryBuilder()](#cypher-neoquerybuilder)
       - [queryBuilder.cypher(query)](#cypher-neoquerybuilder-querybuildercypherquery)
         - [when valid](#cypher-neoquerybuilder-querybuildercypherquery-when-valid)
       - [queryBuilder.direction(query)](#cypher-neoquerybuilder-querybuilderdirectionquery)
         - [n](#cypher-neoquerybuilder-querybuilderdirectionquery-n)
           - [when valid](#cypher-neoquerybuilder-querybuilderdirectionquery-n-when-valid)
         - [tn](#cypher-neoquerybuilder-querybuilderdirectionquery-tn)
           - [when valid](#cypher-neoquerybuilder-querybuilderdirectionquery-tn-when-valid)
         - [fn](#cypher-neoquerybuilder-querybuilderdirectionquery-fn)
           - [when valid](#cypher-neoquerybuilder-querybuilderdirectionquery-fn-when-valid)
         - [r](#cypher-neoquerybuilder-querybuilderdirectionquery-r)
           - [when valid](#cypher-neoquerybuilder-querybuilderdirectionquery-r-when-valid)
         - [tr](#cypher-neoquerybuilder-querybuilderdirectionquery-tr)
           - [when valid](#cypher-neoquerybuilder-querybuilderdirectionquery-tr-when-valid)
         - [fr](#cypher-neoquerybuilder-querybuilderdirectionquery-fr)
           - [when valid](#cypher-neoquerybuilder-querybuilderdirectionquery-fr-when-valid)
         - [or](#cypher-neoquerybuilder-querybuilderdirectionquery-or)
           - [when valid](#cypher-neoquerybuilder-querybuilderdirectionquery-or-when-valid)
         - [ir](#cypher-neoquerybuilder-querybuilderdirectionquery-ir)
           - [when valid](#cypher-neoquerybuilder-querybuilderdirectionquery-ir-when-valid)
         - [--](#cypher-neoquerybuilder-querybuilderdirectionquery---)
           - [when valid](#cypher-neoquerybuilder-querybuilderdirectionquery----when-valid)
         - [chaining](#cypher-neoquerybuilder-querybuilderdirectionquery-chaining)
           - [when valid](#cypher-neoquerybuilder-querybuilderdirectionquery-chaining-when-valid)
       - [queryBuilder.start(query)](#cypher-neoquerybuilder-querybuilderstartquery)
         - [when valid](#cypher-neoquerybuilder-querybuilderstartquery-when-valid)
       - [queryBuilder.start(nodeId)](#cypher-neoquerybuilder-querybuilderstartnodeid)
         - [when valid](#cypher-neoquerybuilder-querybuilderstartnodeid-when-valid)
       - [queryBuilder.start({query})](#cypher-neoquerybuilder-querybuilderstartquery)
         - [when valid](#cypher-neoquerybuilder-querybuilderstartquery-when-valid)
       - [queryBuilder.start(query, true)](#cypher-neoquerybuilder-querybuilderstartquery-true)
         - [when valid](#cypher-neoquerybuilder-querybuilderstartquery-true-when-valid)
       - [queryBuilder.start(nodeId, true)](#cypher-neoquerybuilder-querybuilderstartnodeid-true)
         - [when valid](#cypher-neoquerybuilder-querybuilderstartnodeid-true-when-valid)
       - [queryBuilder.create(query)](#cypher-neoquerybuilder-querybuildercreatequery)
         - [when valid](#cypher-neoquerybuilder-querybuildercreatequery-when-valid)
       - [queryBuilder.create(query, true)](#cypher-neoquerybuilder-querybuildercreatequery-true)
         - [when valid](#cypher-neoquerybuilder-querybuildercreatequery-true-when-valid)
       - [queryBuilder.match(query)](#cypher-neoquerybuilder-querybuildermatchquery)
         - [when valid](#cypher-neoquerybuilder-querybuildermatchquery-when-valid)
       - [queryBuilder.where(query)](#cypher-neoquerybuilder-querybuilderwherequery)
         - [when valid](#cypher-neoquerybuilder-querybuilderwherequery-when-valid)
       - [queryBuilder.with(query)](#cypher-neoquerybuilder-querybuilderwithquery)
         - [when valid](#cypher-neoquerybuilder-querybuilderwithquery-when-valid)
       - [queryBuilder.set(query)](#cypher-neoquerybuilder-querybuildersetquery)
         - [when valid](#cypher-neoquerybuilder-querybuildersetquery-when-valid)
       - [queryBuilder.merge(query)](#cypher-neoquerybuilder-querybuildermergequery)
         - [when valid](#cypher-neoquerybuilder-querybuildermergequery-when-valid)
       - [queryBuilder.drop(query)](#cypher-neoquerybuilder-querybuilderdropquery)
         - [when valid](#cypher-neoquerybuilder-querybuilderdropquery-when-valid)
       - [queryBuilder.remove(query)](#cypher-neoquerybuilder-querybuilderremovequery)
         - [when valid](#cypher-neoquerybuilder-querybuilderremovequery-when-valid)
       - [queryBuilder.del(query)](#cypher-neoquerybuilder-querybuilderdelquery)
         - [when valid](#cypher-neoquerybuilder-querybuilderdelquery-when-valid)
       - [queryBuilder.del([query])](#cypher-neoquerybuilder-querybuilderdelquery)
         - [when valid](#cypher-neoquerybuilder-querybuilderdelquery-when-valid)
       - [queryBuilder.foreach([query])](#cypher-neoquerybuilder-querybuilderforeachquery)
         - [when valid](#cypher-neoquerybuilder-querybuilderforeachquery-when-valid)
       - [queryBuilder.return(query)](#cypher-neoquerybuilder-querybuilderreturnquery)
         - [when valid](#cypher-neoquerybuilder-querybuilderreturnquery-when-valid)
       - [queryBuilder.return([query])](#cypher-neoquerybuilder-querybuilderreturnquery)
         - [when valid](#cypher-neoquerybuilder-querybuilderreturnquery-when-valid)
       - [queryBuilder.return({query})](#cypher-neoquerybuilder-querybuilderreturnquery)
         - [when valid](#cypher-neoquerybuilder-querybuilderreturnquery-when-valid)
       - [queryBuilder.return([query], true)](#cypher-neoquerybuilder-querybuilderreturnquery-true)
         - [when valid](#cypher-neoquerybuilder-querybuilderreturnquery-true-when-valid)
       - [queryBuilder.return({query}, true)](#cypher-neoquerybuilder-querybuilderreturnquery-true)
         - [when valid](#cypher-neoquerybuilder-querybuilderreturnquery-true-when-valid)
       - [queryBuilder.union([query])](#cypher-neoquerybuilder-querybuilderunionquery)
         - [when valid](#cypher-neoquerybuilder-querybuilderunionquery-when-valid)
       - [queryBuilder.using(query)](#cypher-neoquerybuilder-querybuilderusingquery)
         - [when valid](#cypher-neoquerybuilder-querybuilderusingquery-when-valid)
       - [queryBuilder.using(query, parameter)](#cypher-neoquerybuilder-querybuilderusingquery-parameter)
         - [when valid](#cypher-neoquerybuilder-querybuilderusingquery-parameter-when-valid)
       - [queryBuilder.orderBy(query)](#cypher-neoquerybuilder-querybuilderorderbyquery)
         - [when valid](#cypher-neoquerybuilder-querybuilderorderbyquery-when-valid)
       - [queryBuilder.orderBy([query])](#cypher-neoquerybuilder-querybuilderorderbyquery)
         - [when valid](#cypher-neoquerybuilder-querybuilderorderbyquery-when-valid)
       - [queryBuilder.orderBy({query})](#cypher-neoquerybuilder-querybuilderorderbyquery)
         - [when valid](#cypher-neoquerybuilder-querybuilderorderbyquery-when-valid)
       - [queryBuilder.orderBy([query], true)](#cypher-neoquerybuilder-querybuilderorderbyquery-true)
         - [when valid](#cypher-neoquerybuilder-querybuilderorderbyquery-true-when-valid)
       - [queryBuilder.orderBy({query}, true)](#cypher-neoquerybuilder-querybuilderorderbyquery-true)
         - [when valid](#cypher-neoquerybuilder-querybuilderorderbyquery-true-when-valid)
       - [queryBuilder.skip(skip)](#cypher-neoquerybuilder-querybuilderskipskip)
         - [when valid](#cypher-neoquerybuilder-querybuilderskipskip-when-valid)
       - [queryBuilder.limit(limit)](#cypher-neoquerybuilder-querybuilderlimitlimit)
         - [when valid](#cypher-neoquerybuilder-querybuilderlimitlimit-when-valid)
       - [queryBuilder.limit(limit, step)](#cypher-neoquerybuilder-querybuilderlimitlimit-step)
         - [when valid](#cypher-neoquerybuilder-querybuilderlimitlimit-step-when-valid)
       - [queryBuilder.getList(type)](#cypher-neoquerybuilder-querybuildergetlisttype)
         - [when valid](#cypher-neoquerybuilder-querybuildergetlisttype-when-valid)
       - [queryBuilder.execute()](#cypher-neoquerybuilder-querybuilderexecute)
         - [when valid](#cypher-neoquerybuilder-querybuilderexecute-when-valid)
   - [Index](#index)
     - [neo.createIndex(label, [property])](#index-neocreateindexlabel-property)
       - [when valid](#index-neocreateindexlabel-property-when-valid)
     - [neo.readIndex(label)](#index-neoreadindexlabel)
       - [when valid](#index-neoreadindexlabel-when-valid)
     - [neo.deleteIndex(label, property)](#index-neodeleteindexlabel-property)
       - [when valid](#index-neodeleteindexlabel-property-when-valid)
   - [Label](#label)
     - [neo.createLabel(nodeId, [labels])](#label-neocreatelabelnodeid-labels)
       - [when valid](#label-neocreatelabelnodeid-labels-when-valid)
     - [neo.createLabel(nodeId, label)](#label-neocreatelabelnodeid-label)
       - [when valid](#label-neocreatelabelnodeid-label-when-valid)
     - [neo.updateLabel(nodeId, labels)](#label-neoupdatelabelnodeid-labels)
       - [when valid](#label-neoupdatelabelnodeid-labels-when-valid)
     - [neo.readLabel(nodeId)](#label-neoreadlabelnodeid)
       - [when valid](#label-neoreadlabelnodeid-when-valid)
     - [neo.readLabel()](#label-neoreadlabel)
       - [when valid](#label-neoreadlabel-when-valid)
     - [neo.deleteLabel(nodeId, label)](#label-neodeletelabelnodeid-label)
       - [when valid](#label-neodeletelabelnodeid-label-when-valid)
   - [Main](#main)
     - [create new connection](#main-create-new-connection)
       - [new Neo4js()](#main-create-new-connection-new-neo4js)
         - [when valid](#main-create-new-connection-new-neo4js-when-valid)
       - [new Neo4js(url)](#main-create-new-connection-new-neo4jsurl)
         - [when valid](#main-create-new-connection-new-neo4jsurl-when-valid)
     - [neo.service()](#main-neoservice)
       - [when valid](#main-neoservice-when-valid)
   - [Node](#node)
     - [neo.createNode({properties})](#node-neocreatenodeproperties)
       - [when valid](#node-neocreatenodeproperties-when-valid)
     - [neo.readNode(nodeId)](#node-neoreadnodenodeid)
       - [when valid](#node-neoreadnodenodeid-when-valid)
     - [neo.updateNodeProperty(nodeId, property, value)](#node-neoupdatenodepropertynodeid-property-value)
       - [when valid](#node-neoupdatenodepropertynodeid-property-value-when-valid)
     - [neo.updateNodeProperty(nodeId, {properties})](#node-neoupdatenodepropertynodeid-properties)
       - [when valid](#node-neoupdatenodepropertynodeid-properties-when-valid)
     - [neo.readNodeProperty(nodeId)](#node-neoreadnodepropertynodeid)
       - [when valid](#node-neoreadnodepropertynodeid-when-valid)
     - [neo.deleteNodeProperty(nodeId, property)](#node-neodeletenodepropertynodeid-property)
       - [when valid](#node-neodeletenodepropertynodeid-property-when-valid)
     - [neo.deleteNodeProperty(nodeId)](#node-neodeletenodepropertynodeid)
       - [when valid](#node-neodeletenodepropertynodeid-when-valid)
     - [neo.deleteNode(nodeId)](#node-neodeletenodenodeid)
       - [when valid](#node-neodeletenodenodeid-when-valid)
   - [Relationship](#relationship)
     - [neo.createRelationship(fromNodeId, toNodeId, relationship, relationshipProperty)](#relationship-neocreaterelationshipfromnodeid-tonodeid-relationship-relationshipproperty)
       - [when valid](#relationship-neocreaterelationshipfromnodeid-tonodeid-relationship-relationshipproperty-when-valid)
     - [neo.readRelationship(relationshipId)](#relationship-neoreadrelationshiprelationshipid)
       - [when valid](#relationship-neoreadrelationshiprelationshipid-when-valid)
     - [neo.updateRelationshipProperty(relationshipId, property, value)](#relationship-neoupdaterelationshippropertyrelationshipid-property-value)
       - [when valid](#relationship-neoupdaterelationshippropertyrelationshipid-property-value-when-valid)
     - [neo.updateRelationshipProperty(relationshipId, {properties})](#relationship-neoupdaterelationshippropertyrelationshipid-properties)
       - [when valid](#relationship-neoupdaterelationshippropertyrelationshipid-properties-when-valid)
     - [neo.readRelationshipProperty(relationshipId)](#relationship-neoreadrelationshippropertyrelationshipid)
       - [when valid](#relationship-neoreadrelationshippropertyrelationshipid-when-valid)
     - [neo.readRelationshipType()](#relationship-neoreadrelationshiptype)
       - [when valid](#relationship-neoreadrelationshiptype-when-valid)
     - [neo.readTypedRelationship(nodeId, 'all')](#relationship-neoreadtypedrelationshipnodeid-all)
       - [when valid](#relationship-neoreadtypedrelationshipnodeid-all-when-valid)
     - [neo.readTypedRelationship(nodeId, 'in')](#relationship-neoreadtypedrelationshipnodeid-in)
       - [when valid](#relationship-neoreadtypedrelationshipnodeid-in-when-valid)
     - [neo.readTypedRelationship(nodeId, 'out')](#relationship-neoreadtypedrelationshipnodeid-out)
       - [when valid](#relationship-neoreadtypedrelationshipnodeid-out-when-valid)
     - [neo.readTypedRelationship(nodeId, 'all', label)](#relationship-neoreadtypedrelationshipnodeid-all-label)
       - [when valid](#relationship-neoreadtypedrelationshipnodeid-all-label-when-valid)
     - [neo.readTypedRelationship(nodeId, 'in', label)](#relationship-neoreadtypedrelationshipnodeid-in-label)
       - [when valid](#relationship-neoreadtypedrelationshipnodeid-in-label-when-valid)
     - [neo.readTypedRelationship(nodeId, 'out', label)](#relationship-neoreadtypedrelationshipnodeid-out-label)
       - [when valid](#relationship-neoreadtypedrelationshipnodeid-out-label-when-valid)
     - [neo.readTypedRelationship(nodeId, 'all', [labels])](#relationship-neoreadtypedrelationshipnodeid-all-labels)
       - [when valid](#relationship-neoreadtypedrelationshipnodeid-all-labels-when-valid)
     - [neo.deleteRelationshipProperty(relationshipId, property)](#relationship-neodeleterelationshippropertyrelationshipid-property)
       - [when valid](#relationship-neodeleterelationshippropertyrelationshipid-property-when-valid)
     - [neo.deleteRelationshipProperty(relationshipId)](#relationship-neodeleterelationshippropertyrelationshipid)
       - [when valid](#relationship-neodeleterelationshippropertyrelationshipid-when-valid)
     - [neo.deleteRelationship(relationshipId)](#relationship-neodeleterelationshiprelationshipid)
       - [when valid](#relationship-neodeleterelationshiprelationshipid-when-valid)
   - [Traversal](#traversal)
     - [neo.createPagedTraverse(nodeId, {properties})](#traversal-neocreatepagedtraversenodeid-properties)
       - [when valid](#traversal-neocreatepagedtraversenodeid-properties-when-valid)
     - [neo.traversePath(nodeId, {properties})](#traversal-neotraversepathnodeid-properties)
       - [when valid](#traversal-neotraversepathnodeid-properties-when-valid)
     - [neo.traverseNode(nodeId, {property})](#traversal-neotraversenodenodeid-property)
       - [when valid](#traversal-neotraversenodenodeid-property-when-valid)
     - [neo.traverseRelationship(nodeId, {property})](#traversal-neotraverserelationshipnodeid-property)
       - [when valid](#traversal-neotraverserelationshipnodeid-property-when-valid)
     - [neo.pagedTraverse(nodeId, {parameters})](#traversal-neopagedtraversenodeid-parameters)
       - [when valid](#traversal-neopagedtraversenodeid-parameters-when-valid)
   - [Utils](#utils)
     - [neo.objToStr({object})](#utils-neoobjtostrobject)
       - [when valid](#utils-neoobjtostrobject-when-valid)
<a name=""></a>
 
<a name="algorithm"></a>
# Algorithm
<a name="algorithm-neofindpathnodeid-parameters"></a>
## neo.findPath(nodeId, {parameters})
<a name="algorithm-neofindpathnodeid-parameters-when-valid"></a>
### when valid
should return path detail from A to B.

```js
return neo.findPath(testNode[0]._id, {
  "to": "http://localhost:7474/db/data/node/" + testNode[1]._id,
  "max_depth": 3,
  "relationships": {
    "type": "testfriend",
    "direction": "out"
  },
  "algorithm": "shortestPath"
}).then(function(result) {
  result[0].start.should.equal("http://localhost:7474/db/data/node/" + testNode[0]._id);
  return result[0].end.should.equal("http://localhost:7474/db/data/node/" + testNode[1]._id);
});
```

<a name="batch"></a>
# Batch
<a name="batch-neoexecutebatchtasks"></a>
## neo.executeBatch([tasks])
<a name="batch-neoexecutebatchtasks-when-valid"></a>
### when valid
should return all task result.

```js
return neo.executeBatch([
  {
    "method": "GET",
    "to": "/node/" + testNode[0]._id,
    "id": parseInt(testNode[0]._id)
  }, {
    "method": "GET",
    "to": "/node/" + testNode[1]._id,
    "id": parseInt(testNode[1]._id)
  }
]).then(function(result) {
  result[0].id.should.equal(parseInt(testNode[0]._id));
  return result[1].id.should.equal(parseInt(testNode[1]._id));
});
```

<a name="constraint"></a>
# Constraint
<a name="constraint-neocreateuniquenessconstraintlabel-property"></a>
## neo.createUniquenessConstraint(label, [property])
<a name="constraint-neocreateuniquenessconstraintlabel-property-when-valid"></a>
### when valid
should return true.

```js
return neo.createUniquenessConstraint('person', [randomProperty]).then(function(result) {
  return result.should.be["true"];
}).fail(function(result) {
  return console.log(randomProperty);
});
```

<a name="constraint-neoreadconstraint"></a>
## neo.readConstraint()
<a name="constraint-neoreadconstraint-when-valid"></a>
### when valid
should return all constraint.

```js
return neo.readConstraint().should.eventually.have.length.of.at.least(1);
```

<a name="constraint-neoreaduniquenessconstraintlabel-property"></a>
## neo.readUniquenessConstraint(label, property)
<a name="constraint-neoreaduniquenessconstraintlabel-property-when-valid"></a>
### when valid
should return node with specified label and constraint.

```js
return neo.readUniquenessConstraint('person', randomProperty).then(function(result) {
  return result[0]['property-keys'][0].should.equal(randomProperty);
});
```

<a name="constraint-neodeleteconstraintlabel-property"></a>
## neo.deleteConstraint(label, property)
<a name="constraint-neodeleteconstraintlabel-property-when-valid"></a>
### when valid
should return true.

```js
return neo.deleteConstraint('person', randomProperty).should.eventually.be["true"];
```

<a name="cypher"></a>
# Cypher
<a name="cypher-neoexecutecypherquery-parameters"></a>
## neo.executeCypher(query, parameters)
<a name="cypher-neoexecutecypherquery-parameters-when-valid"></a>
### when valid
should run cypher query.

```js
return neo.executeCypher('START n = node({nodeId}) RETURN n', {
  "nodeId": parseInt(testNode[0]._id)
}).then(function(result) {
  return result.should.include.keys('columns');
});
```

<a name="cypher-neoquerybuilder"></a>
## neo.queryBuilder()
<a name="cypher-neoquerybuilder-querybuildercypherquery"></a>
### queryBuilder.cypher(query)
<a name="cypher-neoquerybuilder-querybuildercypherquery-when-valid"></a>
#### when valid
should construct correct cypher query.

```js
return queryBuilder.cypher('START n = node(*)').toString().should.equal('START n = node(*)');
```

<a name="cypher-neoquerybuilder-querybuilderdirectionquery"></a>
### queryBuilder.direction(query)
<a name="cypher-neoquerybuilder-querybuilderdirectionquery-n"></a>
#### n
<a name="cypher-neoquerybuilder-querybuilderdirectionquery-n-when-valid"></a>
##### when valid
should construct correct cypher query.

```js
return queryBuilder.direction('n').toString().should.equal('()');
```

<a name="cypher-neoquerybuilder-querybuilderdirectionquery-tn"></a>
#### tn
<a name="cypher-neoquerybuilder-querybuilderdirectionquery-tn-when-valid"></a>
##### when valid
should construct correct cypher query.

```js
return queryBuilder.direction('tn=n').toString().should.equal('-->(n)');
```

<a name="cypher-neoquerybuilder-querybuilderdirectionquery-fn"></a>
#### fn
<a name="cypher-neoquerybuilder-querybuilderdirectionquery-fn-when-valid"></a>
##### when valid
should construct correct cypher query.

```js
return queryBuilder.direction('fn=n').toString().should.equal('<--(n)');
```

<a name="cypher-neoquerybuilder-querybuilderdirectionquery-r"></a>
#### r
<a name="cypher-neoquerybuilder-querybuilderdirectionquery-r-when-valid"></a>
##### when valid
should construct correct cypher query.

```js
return queryBuilder.direction('r=r').toString().should.equal('-[r]->');
```

<a name="cypher-neoquerybuilder-querybuilderdirectionquery-tr"></a>
#### tr
<a name="cypher-neoquerybuilder-querybuilderdirectionquery-tr-when-valid"></a>
##### when valid
should construct correct cypher query.

```js
return queryBuilder.direction('tr=r').toString().should.equal('-[r]->');
```

<a name="cypher-neoquerybuilder-querybuilderdirectionquery-fr"></a>
#### fr
<a name="cypher-neoquerybuilder-querybuilderdirectionquery-fr-when-valid"></a>
##### when valid
should construct correct cypher query.

```js
return queryBuilder.direction('fr=r').toString().should.equal('<-[r]-');
```

<a name="cypher-neoquerybuilder-querybuilderdirectionquery-or"></a>
#### or
<a name="cypher-neoquerybuilder-querybuilderdirectionquery-or-when-valid"></a>
##### when valid
should construct correct cypher query.

```js
return queryBuilder.direction('or=r').toString().should.equal('<-[r]->');
```

<a name="cypher-neoquerybuilder-querybuilderdirectionquery-ir"></a>
#### ir
<a name="cypher-neoquerybuilder-querybuilderdirectionquery-ir-when-valid"></a>
##### when valid
should construct correct cypher query.

```js
return queryBuilder.direction('ir=r').toString().should.equal('-[r]-');
```

<a name="cypher-neoquerybuilder-querybuilderdirectionquery---"></a>
#### --
<a name="cypher-neoquerybuilder-querybuilderdirectionquery----when-valid"></a>
##### when valid
should construct correct cypher query.

```js
return queryBuilder.direction('--').toString().should.equal('--');
```

<a name="cypher-neoquerybuilder-querybuilderdirectionquery-chaining"></a>
#### chaining
<a name="cypher-neoquerybuilder-querybuilderdirectionquery-chaining-when-valid"></a>
##### when valid
should construct correct cypher query.

```js
return queryBuilder.direction('n=n/r=friend/n=m').toString().should.equal('(n)-[friend]->(m)');
```

<a name="cypher-neoquerybuilder-querybuilderstartquery"></a>
### queryBuilder.start(query)
<a name="cypher-neoquerybuilder-querybuilderstartquery-when-valid"></a>
#### when valid
should construct correct cypher query.

```js
return queryBuilder.start('*').toString().should.equal('START n = node(*)');
```

<a name="cypher-neoquerybuilder-querybuilderstartnodeid"></a>
### queryBuilder.start(nodeId)
<a name="cypher-neoquerybuilder-querybuilderstartnodeid-when-valid"></a>
#### when valid
should construct correct cypher query.

```js
queryBuilder.start(1).toString().should.equal('START n = node({id})');
queryBuilder.getParams().should.include.keys('id');
return queryBuilder.getParams().id.should.equal(1);
```

<a name="cypher-neoquerybuilder-querybuilderstartquery"></a>
### queryBuilder.start(query)
<a name="cypher-neoquerybuilder-querybuilderstartquery-when-valid"></a>
#### when valid
should construct correct cypher query.

```js
return queryBuilder.start('n = node(*)').toString().should.equal('START n = node(*)');
```

<a name="cypher-neoquerybuilder-querybuilderstartquery"></a>
### queryBuilder.start({query})
<a name="cypher-neoquerybuilder-querybuilderstartquery-when-valid"></a>
#### when valid
should construct correct cypher query.

```js
queryBuilder.start({
  name: 'Kieve'
}).toString().should.equal('START name = node({name})');
queryBuilder.getParams().should.include.keys('name');
return queryBuilder.getParams().name.should.equal('Kieve');
```

<a name="cypher-neoquerybuilder-querybuilderstartquery-true"></a>
### queryBuilder.start(query, true)
<a name="cypher-neoquerybuilder-querybuilderstartquery-true-when-valid"></a>
#### when valid
should construct correct cypher query.

```js
return queryBuilder.start('*', true).toString().should.equal('START r = relationship(*)');
```

<a name="cypher-neoquerybuilder-querybuilderstartnodeid-true"></a>
### queryBuilder.start(nodeId, true)
<a name="cypher-neoquerybuilder-querybuilderstartnodeid-true-when-valid"></a>
#### when valid
should construct correct cypher query.

```js
queryBuilder.start(1, true).toString().should.equal('START r = relationship({id})');
queryBuilder.getParams().should.include.keys('id');
return queryBuilder.getParams().id.should.equal(1);
```

<a name="cypher-neoquerybuilder-querybuildercreatequery"></a>
### queryBuilder.create(query)
<a name="cypher-neoquerybuilder-querybuildercreatequery-when-valid"></a>
#### when valid
should create normal query.

```js
return queryBuilder.create('n').toString().should.equal('CREATE n');
```

<a name="cypher-neoquerybuilder-querybuildercreatequery-true"></a>
### queryBuilder.create(query, true)
<a name="cypher-neoquerybuilder-querybuildercreatequery-true-when-valid"></a>
#### when valid
should create unique query.

```js
return queryBuilder.create('n', true).toString().should.equal('CREATE UNIQUE n');
```

<a name="cypher-neoquerybuilder-querybuildermatchquery"></a>
### queryBuilder.match(query)
<a name="cypher-neoquerybuilder-querybuildermatchquery-when-valid"></a>
#### when valid
should construct correct cypher query.

```js
return queryBuilder.match('(movie:Movie)').toString().should.equal('MATCH (movie:Movie)');
```

<a name="cypher-neoquerybuilder-querybuilderwherequery"></a>
### queryBuilder.where(query)
<a name="cypher-neoquerybuilder-querybuilderwherequery-when-valid"></a>
#### when valid
should construct correct cypher query.

```js
return queryBuilder.where('n:Swedish').toString().should.equal('WHERE n:Swedish');
```

<a name="cypher-neoquerybuilder-querybuilderwithquery"></a>
### queryBuilder.with(query)
<a name="cypher-neoquerybuilder-querybuilderwithquery-when-valid"></a>
#### when valid
should construct correct cypher query.

```js
return queryBuilder["with"]('m').toString().should.equal('WITH m');
```

<a name="cypher-neoquerybuilder-querybuildersetquery"></a>
### queryBuilder.set(query)
<a name="cypher-neoquerybuilder-querybuildersetquery-when-valid"></a>
#### when valid
should construct correct cypher query.

```js
return queryBuilder.set("n.surname = 'Kieve'").toString().should.equal("SET n.surname = 'Kieve'");
```

<a name="cypher-neoquerybuilder-querybuildermergequery"></a>
### queryBuilder.merge(query)
<a name="cypher-neoquerybuilder-querybuildermergequery-when-valid"></a>
#### when valid
should construct correct cypher query.

```js
return queryBuilder.merge('kieve:Critic').toString().should.equal('MERGE (kieve:Critic)');
```

<a name="cypher-neoquerybuilder-querybuilderdropquery"></a>
### queryBuilder.drop(query)
<a name="cypher-neoquerybuilder-querybuilderdropquery-when-valid"></a>
#### when valid
should construct correct cypher query.

```js
return queryBuilder.drop('(movie:Movie)').toString().should.equal('DROP (movie:Movie)');
```

<a name="cypher-neoquerybuilder-querybuilderremovequery"></a>
### queryBuilder.remove(query)
<a name="cypher-neoquerybuilder-querybuilderremovequery-when-valid"></a>
#### when valid
should construct correct cypher query.

```js
return queryBuilder.remove('kieve.age').toString().should.equal('REMOVE kieve.age');
```

<a name="cypher-neoquerybuilder-querybuilderdelquery"></a>
### queryBuilder.del(query)
<a name="cypher-neoquerybuilder-querybuilderdelquery-when-valid"></a>
#### when valid
should construct correct cypher query.

```js
return queryBuilder.del('n').toString().should.equal('DELETE n');
```

<a name="cypher-neoquerybuilder-querybuilderdelquery"></a>
### queryBuilder.del([query])
<a name="cypher-neoquerybuilder-querybuilderdelquery-when-valid"></a>
#### when valid
should construct correct cypher query.

```js
return queryBuilder.del(['n', 'm']).toString().should.equal('DELETE n, m');
```

<a name="cypher-neoquerybuilder-querybuilderforeachquery"></a>
### queryBuilder.foreach([query])
<a name="cypher-neoquerybuilder-querybuilderforeachquery-when-valid"></a>
#### when valid
should construct correct cypher query.

```js
return queryBuilder.foreach('(n IN nodes(p)| SET n.marked = TRUE )').toString().should.equal('FOREACH (n IN nodes(p)| SET n.marked = TRUE )');
```

<a name="cypher-neoquerybuilder-querybuilderreturnquery"></a>
### queryBuilder.return(query)
<a name="cypher-neoquerybuilder-querybuilderreturnquery-when-valid"></a>
#### when valid
should construct correct cypher query.

```js
return queryBuilder["return"]('n').toString().should.equal('RETURN n');
```

<a name="cypher-neoquerybuilder-querybuilderreturnquery"></a>
### queryBuilder.return([query])
<a name="cypher-neoquerybuilder-querybuilderreturnquery-when-valid"></a>
#### when valid
should construct correct cypher query.

```js
return queryBuilder["return"](['name', 'age']).toString().should.equal('RETURN n.name, n.age');
```

<a name="cypher-neoquerybuilder-querybuilderreturnquery"></a>
### queryBuilder.return({query})
<a name="cypher-neoquerybuilder-querybuilderreturnquery-when-valid"></a>
#### when valid
should construct correct cypher query.

```js
return queryBuilder["return"]({
  'name': 'Name',
  'age': 'Age'
}).toString().should.equal('RETURN n.name AS Name, n.age AS Age');
```

<a name="cypher-neoquerybuilder-querybuilderreturnquery-true"></a>
### queryBuilder.return([query], true)
<a name="cypher-neoquerybuilder-querybuilderreturnquery-true-when-valid"></a>
#### when valid
should construct correct cypher query.

```js
return queryBuilder["return"](['name', 'age'], true).toString().should.equal('RETURN r.name, r.age');
```

<a name="cypher-neoquerybuilder-querybuilderreturnquery-true"></a>
### queryBuilder.return({query}, true)
<a name="cypher-neoquerybuilder-querybuilderreturnquery-true-when-valid"></a>
#### when valid
should construct correct cypher query.

```js
return queryBuilder["return"]({
  'name': 'Name',
  'age': 'Age'
}, true).toString().should.equal('RETURN r.name AS Name, r.age AS Age');
```

<a name="cypher-neoquerybuilder-querybuilderunionquery"></a>
### queryBuilder.union([query])
<a name="cypher-neoquerybuilder-querybuilderunionquery-when-valid"></a>
#### when valid
should construct correct cypher query.

```js
return queryBuilder.union('all').toString().should.equal('UNION ALL');
```

<a name="cypher-neoquerybuilder-querybuilderusingquery"></a>
### queryBuilder.using(query)
<a name="cypher-neoquerybuilder-querybuilderusingquery-when-valid"></a>
#### when valid
should construct correct cypher query.

```js
return queryBuilder.using('n:Swedish(surname)').toString().should.equal('USING n:Swedish(surname)');
```

<a name="cypher-neoquerybuilder-querybuilderusingquery-parameter"></a>
### queryBuilder.using(query, parameter)
<a name="cypher-neoquerybuilder-querybuilderusingquery-parameter-when-valid"></a>
#### when valid
should construct correct cypher query.

```js
return queryBuilder.using('n:Swedish(surname)', 'INDEX').toString().should.equal('USING INDEX n:Swedish(surname)');
```

<a name="cypher-neoquerybuilder-querybuilderorderbyquery"></a>
### queryBuilder.orderBy(query)
<a name="cypher-neoquerybuilder-querybuilderorderbyquery-when-valid"></a>
#### when valid
should construct correct cypher query.

```js
return queryBuilder.orderBy('n.name').toString().should.equal('ORDER BY n.name');
```

<a name="cypher-neoquerybuilder-querybuilderorderbyquery"></a>
### queryBuilder.orderBy([query])
<a name="cypher-neoquerybuilder-querybuilderorderbyquery-when-valid"></a>
#### when valid
should construct correct cypher query.

```js
return queryBuilder.orderBy(['name', 'age']).toString().should.equal('ORDER BY n.name, n.age');
```

<a name="cypher-neoquerybuilder-querybuilderorderbyquery"></a>
### queryBuilder.orderBy({query})
<a name="cypher-neoquerybuilder-querybuilderorderbyquery-when-valid"></a>
#### when valid
should construct correct cypher query.

```js
return queryBuilder.orderBy({
  'name': 'asc',
  'age': 1,
  'gender': true
}).toString().should.equal('ORDER BY n.name ASC, n.age ASC, n.gender ASC');
```

<a name="cypher-neoquerybuilder-querybuilderorderbyquery-true"></a>
### queryBuilder.orderBy([query], true)
<a name="cypher-neoquerybuilder-querybuilderorderbyquery-true-when-valid"></a>
#### when valid
should construct correct cypher query.

```js
return queryBuilder.orderBy(['name', 'age'], true).toString().should.equal('ORDER BY r.name, r.age');
```

<a name="cypher-neoquerybuilder-querybuilderorderbyquery-true"></a>
### queryBuilder.orderBy({query}, true)
<a name="cypher-neoquerybuilder-querybuilderorderbyquery-true-when-valid"></a>
#### when valid
should construct correct cypher query.

```js
return queryBuilder.orderBy({
  'name': 'asc',
  'age': 1,
  'gender': true
}, true).toString().should.equal('ORDER BY r.name ASC, r.age ASC, r.gender ASC');
```

<a name="cypher-neoquerybuilder-querybuilderskipskip"></a>
### queryBuilder.skip(skip)
<a name="cypher-neoquerybuilder-querybuilderskipskip-when-valid"></a>
#### when valid
should construct correct cypher query.

```js
return queryBuilder.skip(1).toString().should.equal('SKIP 1');
```

<a name="cypher-neoquerybuilder-querybuilderlimitlimit"></a>
### queryBuilder.limit(limit)
<a name="cypher-neoquerybuilder-querybuilderlimitlimit-when-valid"></a>
#### when valid
should construct correct cypher query.

```js
return queryBuilder.limit(1).toString().should.equal('LIMIT 1');
```

<a name="cypher-neoquerybuilder-querybuilderlimitlimit-step"></a>
### queryBuilder.limit(limit, step)
<a name="cypher-neoquerybuilder-querybuilderlimitlimit-step-when-valid"></a>
#### when valid
should construct correct cypher query.

```js
return queryBuilder.limit(1, 2).toString().should.equal('LIMIT 1 SKIP 2');
```

<a name="cypher-neoquerybuilder-querybuildergetlisttype"></a>
### queryBuilder.getList(type)
<a name="cypher-neoquerybuilder-querybuildergetlisttype-when-valid"></a>
#### when valid
should construct correct cypher query.

```js
return queryBuilder.getList('function').should.deep.equal(['ALL', 'ANY', 'NONE', 'SINGLE', 'LENGTH', 'TYPE', 'ID', 'COALESCE', 'HEAD', 'LAST', 'TIMESTAMP', 'STARTNODE', 'ENDNODE', 'NODES', 'RELATIONSHIPS', 'LABELS', 'EXTRACT', 'FILTER', 'TAIL', 'RANGE', 'REDUCE', 'ABS', 'ACOS', 'ASIN', 'ATAN', 'COS', 'COT', 'DEGREES', 'E', 'EXP', 'FLOOR', 'HAVERSIN', 'LOG', 'LOG10', 'PI', 'RADIANS', 'RAND', 'ROUND', 'SIGN', 'SIN', 'SQRT', 'TAN', 'STR', 'REPLACE', 'SUBSTRING', 'LEFT', 'RIGHT', 'LTRIM', 'RTRIM', 'TRIM', 'LOWER', 'UPPER']);
```

<a name="cypher-neoquerybuilder-querybuilderexecute"></a>
### queryBuilder.execute()
<a name="cypher-neoquerybuilder-querybuilderexecute-when-valid"></a>
#### when valid
should run cypher query.

```js
var result;
result = queryBuilder.start('*')["return"]('*').execute();
return result.should.eventually.include.keys('data');
```

<a name="index"></a>
# Index
<a name="index-neocreateindexlabel-property"></a>
## neo.createIndex(label, [property])
<a name="index-neocreateindexlabel-property-when-valid"></a>
### when valid
should create an index.

```js
return neo.createIndex('testuser', ['name']).then(function(result) {
  result.label.should.equal('testuser');
  return result['property-keys'].should.include('name');
});
```

<a name="index-neoreadindexlabel"></a>
## neo.readIndex(label)
<a name="index-neoreadindexlabel-when-valid"></a>
### when valid
should return nodes under specified label.

```js
return neo.readIndex('testuser').then(function(result) {
  result[0].label.should.equal('testuser');
  return result[0]['property-keys'].should.include('name');
});
```

<a name="index-neodeleteindexlabel-property"></a>
## neo.deleteIndex(label, property)
<a name="index-neodeleteindexlabel-property-when-valid"></a>
### when valid
should drop index.

```js
return neo.deleteIndex('testuser', 'name').should.eventually.be["true"];
```

<a name="label"></a>
# Label
<a name="label-neocreatelabelnodeid-labels"></a>
## neo.createLabel(nodeId, [labels])
<a name="label-neocreatelabelnodeid-labels-when-valid"></a>
### when valid
should insert labels to a node.

```js
return neo.createLabel(testNode[0]._id, ['testfriend', 'testcolleagu2e']).should.eventually.be["true"];
```

<a name="label-neocreatelabelnodeid-label"></a>
## neo.createLabel(nodeId, label)
<a name="label-neocreatelabelnodeid-label-when-valid"></a>
### when valid
should insert label to a node.

```js
return neo.createLabel(testNode[1]._id, 'testfriend').should.eventually.be["true"];
```

<a name="label-neoupdatelabelnodeid-labels"></a>
## neo.updateLabel(nodeId, labels)
<a name="label-neoupdatelabelnodeid-labels-when-valid"></a>
### when valid
should replace labels of a node.

```js
return neo.updateLabel(testNode[0]._id, ['testbestfriend']).should.eventually.be["true"];
```

<a name="label-neoreadlabelnodeid"></a>
## neo.readLabel(nodeId)
<a name="label-neoreadlabelnodeid-when-valid"></a>
### when valid
should return labels of a node.

```js
return neo.readLabel(testNode[0]._id).should.eventually.include('testbestfriend');
```

<a name="label-neoreadlabel"></a>
## neo.readLabel()
<a name="label-neoreadlabel-when-valid"></a>
### when valid
should return all labels of the database.

```js
return neo.readLabel().then(function(result) {
  result.should.include('testbestfriend');
  return result.should.include('testfriend');
});
```

<a name="label-neodeletelabelnodeid-label"></a>
## neo.deleteLabel(nodeId, label)
<a name="label-neodeletelabelnodeid-label-when-valid"></a>
### when valid
should remove label from a node.

```js
return neo.deleteLabel(testNode[1]._id, 'testfriend').should.eventually.be["true"];
```

<a name="main"></a>
# Main
<a name="main-create-new-connection"></a>
## create new connection
<a name="main-create-new-connection-new-neo4js"></a>
### new Neo4js()
<a name="main-create-new-connection-new-neo4js-when-valid"></a>
#### when valid
should return default Neo4j connection.

```js
return neo.url.should.equal('http://localhost:7474');
```

<a name="main-create-new-connection-new-neo4jsurl"></a>
### new Neo4js(url)
<a name="main-create-new-connection-new-neo4jsurl-when-valid"></a>
#### when valid
should return default Neo4j connection.

```js
return neo.url.should.equal('http://localhost:8484');
```

<a name="main-neoservice"></a>
## neo.service()
<a name="main-neoservice-when-valid"></a>
### when valid
should return Neo4j setting.

```js
return neo.service().should.eventually.have.contain.keys('node', 'node_index', 'relationship_index', 'extensions_info');
```

<a name="node"></a>
# Node
<a name="node-neocreatenodeproperties"></a>
## neo.createNode({properties})
<a name="node-neocreatenodeproperties-when-valid"></a>
### when valid
should create a new node.

```js
return neo.createNode({
  name: 'Kieve'
}).then(function(node) {
  node.should.have.property('name').equal('Kieve');
  return testNode = node;
});
```

<a name="node-neoreadnodenodeid"></a>
## neo.readNode(nodeId)
<a name="node-neoreadnodenodeid-when-valid"></a>
### when valid
should return node details.

```js
return neo.readNode(testNode._id).then(function(result) {
  return result.name.should.equal('Kieve');
});
```

<a name="node-neoupdatenodepropertynodeid-property-value"></a>
## neo.updateNodeProperty(nodeId, property, value)
<a name="node-neoupdatenodepropertynodeid-property-value-when-valid"></a>
### when valid
should update node property.

```js
return neo.updateNodeProperty(testNode._id, 'gender', 'male').should.eventually.be["true"];
```

<a name="node-neoupdatenodepropertynodeid-properties"></a>
## neo.updateNodeProperty(nodeId, {properties})
<a name="node-neoupdatenodepropertynodeid-properties-when-valid"></a>
### when valid
should update node properties.

```js
return neo.updateNodeProperty(testNode._id, {
  'name': 'Kieve Chua',
  'age': 17
}).should.eventually.be["true"];
```

<a name="node-neoreadnodepropertynodeid"></a>
## neo.readNodeProperty(nodeId)
<a name="node-neoreadnodepropertynodeid-when-valid"></a>
### when valid
should return properties of a node.

```js
return neo.readNodeProperty(testNode._id).then(function(result) {
  result.name.should.equal('Kieve Chua');
  return result.age.should.equal(17);
});
```

<a name="node-neodeletenodepropertynodeid-property"></a>
## neo.deleteNodeProperty(nodeId, property)
<a name="node-neodeletenodepropertynodeid-property-when-valid"></a>
### when valid
should delete node property.

```js
return neo.deleteNodeProperty(testNode._id, 'name').should.eventually.be["true"];
```

<a name="node-neodeletenodepropertynodeid"></a>
## neo.deleteNodeProperty(nodeId)
<a name="node-neodeletenodepropertynodeid-when-valid"></a>
### when valid
should delete all property of a node.

```js
return neo.deleteNodeProperty(testNode._id).should.eventually.be["true"];
```

<a name="node-neodeletenodenodeid"></a>
## neo.deleteNode(nodeId)
<a name="node-neodeletenodenodeid-when-valid"></a>
### when valid
should delete a node.

```js
return neo.deleteNode(testNode._id).should.eventually.be["true"];
```

<a name="relationship"></a>
# Relationship
<a name="relationship-neocreaterelationshipfromnodeid-tonodeid-relationship-relationshipproperty"></a>
## neo.createRelationship(fromNodeId, toNodeId, relationship, relationshipProperty)
<a name="relationship-neocreaterelationshipfromnodeid-tonodeid-relationship-relationshipproperty-when-valid"></a>
### when valid
should create relationship between nodes.

```js
return neo.createRelationship(testNode[0]._id, testNode[1]._id, 'friend', {
  since: '10 years ago'
}).then(function(relationship) {
  testRelationship = relationship;
  return relationship.since.should.equal('10 years ago');
});
```

<a name="relationship-neoreadrelationshiprelationshipid"></a>
## neo.readRelationship(relationshipId)
<a name="relationship-neoreadrelationshiprelationshipid-when-valid"></a>
### when valid
should return details of a relationship.

```js
return neo.readRelationship(testRelationship._id).then(function(result) {
  return result.since.should.equal('10 years ago');
});
```

<a name="relationship-neoupdaterelationshippropertyrelationshipid-property-value"></a>
## neo.updateRelationshipProperty(relationshipId, property, value)
<a name="relationship-neoupdaterelationshippropertyrelationshipid-property-value-when-valid"></a>
### when valid
should update relationship's property value.

```js
return neo.updateRelationshipProperty(testRelationship._id, 'since', '11 years ago').should.eventually.be["true"];
```

<a name="relationship-neoupdaterelationshippropertyrelationshipid-properties"></a>
## neo.updateRelationshipProperty(relationshipId, {properties})
<a name="relationship-neoupdaterelationshippropertyrelationshipid-properties-when-valid"></a>
### when valid
should update relationship's properties value.

```js
return neo.updateRelationshipProperty(testRelationship._id, {
  'since': '12 years ago',
  'sinceAge': 17
}).should.eventually.be["true"];
```

<a name="relationship-neoreadrelationshippropertyrelationshipid"></a>
## neo.readRelationshipProperty(relationshipId)
<a name="relationship-neoreadrelationshippropertyrelationshipid-when-valid"></a>
### when valid
should return properties of a relationship.

```js
return neo.readRelationshipProperty(testRelationship._id).then(function(result) {
  result.since.should.equal('12 years ago');
  return result.sinceAge.should.equal(17);
});
```

<a name="relationship-neoreadrelationshiptype"></a>
## neo.readRelationshipType()
<a name="relationship-neoreadrelationshiptype-when-valid"></a>
### when valid
should return all relationships type.

```js
return neo.readRelationshipType().should.eventually.include('friend');
```

<a name="relationship-neoreadtypedrelationshipnodeid-all"></a>
## neo.readTypedRelationship(nodeId, 'all')
<a name="relationship-neoreadtypedrelationshipnodeid-all-when-valid"></a>
### when valid
should return all relationship for a node.

```js
return neo.readTypedRelationship(testNode[1]._id, 'all').should.eventually.have.length(1);
```

<a name="relationship-neoreadtypedrelationshipnodeid-in"></a>
## neo.readTypedRelationship(nodeId, 'in')
<a name="relationship-neoreadtypedrelationshipnodeid-in-when-valid"></a>
### when valid
should return all inbound relationship for a node.

```js
return neo.readTypedRelationship(testNode[1]._id, 'in').should.eventually.have.length(1);
```

<a name="relationship-neoreadtypedrelationshipnodeid-out"></a>
## neo.readTypedRelationship(nodeId, 'out')
<a name="relationship-neoreadtypedrelationshipnodeid-out-when-valid"></a>
### when valid
should return all outbound relationship for a node.

```js
return neo.readTypedRelationship(testNode[1]._id, 'out').should.eventually.be.empty;
```

<a name="relationship-neoreadtypedrelationshipnodeid-all-label"></a>
## neo.readTypedRelationship(nodeId, 'all', label)
<a name="relationship-neoreadtypedrelationshipnodeid-all-label-when-valid"></a>
### when valid
should return all outbound relationship for a node.

```js
return neo.readTypedRelationship(testNode[1]._id, 'all', 'friend').should.eventually.have.length(1);
```

<a name="relationship-neoreadtypedrelationshipnodeid-in-label"></a>
## neo.readTypedRelationship(nodeId, 'in', label)
<a name="relationship-neoreadtypedrelationshipnodeid-in-label-when-valid"></a>
### when valid
should return all outbound relationship for a node.

```js
return neo.readTypedRelationship(testNode[1]._id, 'in', 'friend').should.eventually.have.length(1);
```

<a name="relationship-neoreadtypedrelationshipnodeid-out-label"></a>
## neo.readTypedRelationship(nodeId, 'out', label)
<a name="relationship-neoreadtypedrelationshipnodeid-out-label-when-valid"></a>
### when valid
should return all outbound relationship for a node.

```js
return neo.readTypedRelationship(testNode[1]._id, 'out', 'friend').should.eventually.be.empty;
```

<a name="relationship-neoreadtypedrelationshipnodeid-all-labels"></a>
## neo.readTypedRelationship(nodeId, 'all', [labels])
<a name="relationship-neoreadtypedrelationshipnodeid-all-labels-when-valid"></a>
### when valid
should return all outbound relationship for a node.

```js
return neo.readTypedRelationship(testNode[1]._id, 'all', ['friend', 'lover']).should.eventually.have.length(1);
```

<a name="relationship-neodeleterelationshippropertyrelationshipid-property"></a>
## neo.deleteRelationshipProperty(relationshipId, property)
<a name="relationship-neodeleterelationshippropertyrelationshipid-property-when-valid"></a>
### when valid
should delete relationships's property.

```js
return neo.deleteRelationshipProperty(testRelationship._id, 'since').should.eventually.be["true"];
```

<a name="relationship-neodeleterelationshippropertyrelationshipid"></a>
## neo.deleteRelationshipProperty(relationshipId)
<a name="relationship-neodeleterelationshippropertyrelationshipid-when-valid"></a>
### when valid
should delete all relationships's properties.

```js
return neo.deleteRelationshipProperty(testRelationship._id).should.eventually.be["true"];
```

<a name="relationship-neodeleterelationshiprelationshipid"></a>
## neo.deleteRelationship(relationshipId)
<a name="relationship-neodeleterelationshiprelationshipid-when-valid"></a>
### when valid
should delete relationship.

```js
return neo.deleteRelationship(testRelationship._id).should.eventually.be["true"];
```

<a name="traversal"></a>
# Traversal
<a name="traversal-neocreatepagedtraversenodeid-properties"></a>
## neo.createPagedTraverse(nodeId, {properties})
<a name="traversal-neocreatepagedtraversenodeid-properties-when-valid"></a>
### when valid
should create a paged traverse.

```js
return neo.createPagedTraverse(testNode[0]._id, {
  "prune_evaluator": {
    "language": "builtin",
    "name": "none"
  },
  "return_filter": {
    "language": "javascript",
    "body": "position.endNode().getProperty('name').contains('Test traversal 1');"
  },
  "order": "depth_first",
  "relationships": {
    "type": "testfriend",
    "direction": "out"
  }
}).should.eventually.have.length.of.at.least(1);
```

<a name="traversal-neotraversepathnodeid-properties"></a>
## neo.traversePath(nodeId, {properties})
<a name="traversal-neotraversepathnodeid-properties-when-valid"></a>
### when valid
should return traversed path.

```js
return neo.traversePath(testNode[0]._id, {
  "order": "breadth_first",
  "uniqueness": "none",
  "return_filter": {
    "language": "builtin",
    "name": "all"
  }
}).should.eventually.have.length.of.at.least(1);
```

<a name="traversal-neotraversenodenodeid-property"></a>
## neo.traverseNode(nodeId, {property})
<a name="traversal-neotraversenodenodeid-property-when-valid"></a>
### when valid
should return traversed node.

```js
return neo.traverseNode(testNode[0]._id, {
  "order": "breadth_first",
  "uniqueness": "none",
  "return_filter": {
    "language": "builtin",
    "name": "all"
  }
}).should.eventually.have.length.of.at.least(1);
```

<a name="traversal-neotraverserelationshipnodeid-property"></a>
## neo.traverseRelationship(nodeId, {property})
<a name="traversal-neotraverserelationshipnodeid-property-when-valid"></a>
### when valid
should return traversed node.

```js
return neo.traverseRelationship(testNode[0]._id, {
  "order": "breadth_first",
  "uniqueness": "none",
  "return_filter": {
    "language": "builtin",
    "name": "all"
  }
}).should.eventually.have.length.of.at.least(1);
```

<a name="traversal-neopagedtraversenodeid-parameters"></a>
## neo.pagedTraverse(nodeId, {parameters})
<a name="traversal-neopagedtraversenodeid-parameters-when-valid"></a>
### when valid
should return paged traverse path.

```js
return neo.pagedTraverse(testNode[0]._id, {
  pageSize: 1
}).should.eventually.have.length.of.at.least(1);
```

<a name="utils"></a>
# Utils
<a name="utils-neoobjtostrobject"></a>
## neo.objToStr({object})
<a name="utils-neoobjtostrobject-when-valid"></a>
### when valid
should return stringified object.

```js
return utils.objToStr({
  name: 'kieve',
  age: 18
}).should.equal("{ name : 'kieve', age : '18' }");
```

