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
       - [queryBuilder.start()](#cypher-neoquerybuilder-querybuilderstart)
         - [node](#cypher-neoquerybuilder-querybuilderstart-node)
         - [relationship](#cypher-neoquerybuilder-querybuilderstart-relationship)
       - [queryBuilder.create(query)](#cypher-neoquerybuilder-querybuildercreatequery)
         - [when valid](#cypher-neoquerybuilder-querybuildercreatequery-when-valid)
       - [queryBuilder.create(query, true)](#cypher-neoquerybuilder-querybuildercreatequery-true)
         - [when valid](#cypher-neoquerybuilder-querybuildercreatequery-true-when-valid)
       - [queryBuilder.match(query)](#cypher-neoquerybuilder-querybuildermatchquery)
         - [when valid](#cypher-neoquerybuilder-querybuildermatchquery-when-valid)
       - [where](#cypher-neoquerybuilder-where)
       - [with](#cypher-neoquerybuilder-with)
       - [set](#cypher-neoquerybuilder-set)
       - [merge](#cypher-neoquerybuilder-merge)
       - [drop](#cypher-neoquerybuilder-drop)
       - [remove](#cypher-neoquerybuilder-remove)
       - [delete](#cypher-neoquerybuilder-delete)
         - [string](#cypher-neoquerybuilder-delete-string)
         - [array](#cypher-neoquerybuilder-delete-array)
       - [foreach](#cypher-neoquerybuilder-foreach)
       - [return](#cypher-neoquerybuilder-return)
         - [node](#cypher-neoquerybuilder-return-node)
         - [relationship](#cypher-neoquerybuilder-return-relationship)
       - [union](#cypher-neoquerybuilder-union)
       - [using](#cypher-neoquerybuilder-using)
         - [without param](#cypher-neoquerybuilder-using-without-param)
         - [with param](#cypher-neoquerybuilder-using-with-param)
       - [orderBy](#cypher-neoquerybuilder-orderby)
         - [node](#cypher-neoquerybuilder-orderby-node)
         - [relationship](#cypher-neoquerybuilder-orderby-relationship)
       - [skip](#cypher-neoquerybuilder-skip)
       - [limit](#cypher-neoquerybuilder-limit)
       - [getFunctionList](#cypher-neoquerybuilder-getfunctionlist)
       - [execute](#cypher-neoquerybuilder-execute)
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
       - [Default config](#main-create-new-connection-default-config)
       - [custom config](#main-create-new-connection-custom-config)
   - [Node](#node)
     - [createNode](#node-createnode)
     - [readNode](#node-readnode)
     - [updateNodeProperty](#node-updatenodeproperty)
     - [readNodeProperty](#node-readnodeproperty)
     - [deleteNodeProperty](#node-deletenodeproperty)
     - [deleteNode](#node-deletenode)
   - [Relationship](#relationship)
     - [createRelationship](#relationship-createrelationship)
     - [readRelationship](#relationship-readrelationship)
     - [updateRelationshipProperty](#relationship-updaterelationshipproperty)
     - [readRelationshipProperty](#relationship-readrelationshipproperty)
     - [readRelationshipType](#relationship-readrelationshiptype)
     - [readTypedRelationship](#relationship-readtypedrelationship)
     - [deleteRelationshipProperty](#relationship-deleterelationshipproperty)
       - [delete with property](#relationship-deleterelationshipproperty-delete-with-property)
       - [delete without property](#relationship-deleterelationshipproperty-delete-without-property)
     - [deleteRelationship](#relationship-deleterelationship)
   - [Traversal](#traversal)
     - [createPagedTraverse](#traversal-createpagedtraverse)
     - [traversePath](#traversal-traversepath)
     - [traverseNode](#traversal-traversenode)
     - [pagedTraverse](#traversal-pagedtraverse)
   - [Utils](#utils)
     - [objToStr](#utils-objtostr)
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
should pass.

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

<a name="cypher-neoquerybuilder-querybuilderstart"></a>
### queryBuilder.start()
<a name="cypher-neoquerybuilder-querybuilderstart-node"></a>
#### node
should pass.

```js
return queryBuilder.start('*').toString().should.equal('START n = node(*)');
```

should pass.

```js
queryBuilder.start(1).toString().should.equal('START n = node({id})');
queryBuilder.getParams().should.include.keys('id');
return queryBuilder.getParams().id.should.equal(1);
```

should pass.

```js
return queryBuilder.start('n = node(*)').toString().should.equal('START n = node(*)');
```

should pass.

```js
queryBuilder.start({
  name: 'Kieve'
}).toString().should.equal('START name = node({name})');
queryBuilder.getParams().should.include.keys('name');
return queryBuilder.getParams().name.should.equal('Kieve');
```

<a name="cypher-neoquerybuilder-querybuilderstart-relationship"></a>
#### relationship
should pass.

```js
return queryBuilder.start('*', true).toString().should.equal('START r = relationship(*)');
```

should pass.

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
should pass.

```js
return queryBuilder.match('(movie:Movie)').toString().should.equal('MATCH (movie:Movie)');
```

<a name="cypher-neoquerybuilder-where"></a>
### where
should pass.

```js
return queryBuilder.where('n:Swedish').toString().should.equal('WHERE n:Swedish');
```

<a name="cypher-neoquerybuilder-with"></a>
### with
should pass.

```js
return queryBuilder["with"]('m').toString().should.equal('WITH m');
```

<a name="cypher-neoquerybuilder-set"></a>
### set
should pass.

```js
return queryBuilder.set("n.surname = 'Kieve'").toString().should.equal("SET n.surname = 'Kieve'");
```

<a name="cypher-neoquerybuilder-merge"></a>
### merge
should pass.

```js
return queryBuilder.merge('kieve:Critic').toString().should.equal('MERGE (kieve:Critic)');
```

<a name="cypher-neoquerybuilder-drop"></a>
### drop
should pass.

```js
return queryBuilder.drop('(movie:Movie)').toString().should.equal('DROP (movie:Movie)');
```

<a name="cypher-neoquerybuilder-remove"></a>
### remove
should pass.

```js
return queryBuilder.remove('kieve.age').toString().should.equal('REMOVE kieve.age');
```

<a name="cypher-neoquerybuilder-delete"></a>
### delete
<a name="cypher-neoquerybuilder-delete-string"></a>
#### string
should pass.

```js
return queryBuilder.del('n').toString().should.equal('DELETE n');
```

<a name="cypher-neoquerybuilder-delete-array"></a>
#### array
should pass.

```js
return queryBuilder.del(['n', 'm']).toString().should.equal('DELETE n, m');
```

<a name="cypher-neoquerybuilder-foreach"></a>
### foreach
should pass.

```js
return queryBuilder.foreach('(n IN nodes(p)| SET n.marked = TRUE )').toString().should.equal('FOREACH (n IN nodes(p)| SET n.marked = TRUE )');
```

<a name="cypher-neoquerybuilder-return"></a>
### return
<a name="cypher-neoquerybuilder-return-node"></a>
#### node
should pass.

```js
return queryBuilder["return"]('n').toString().should.equal('RETURN n');
```

should pass.

```js
return queryBuilder["return"](['name', 'age']).toString().should.equal('RETURN n.name, n.age');
```

should pass.

```js
return queryBuilder["return"]({
  'name': 'Name',
  'age': 'Age'
}).toString().should.equal('RETURN n.name AS Name, n.age AS Age');
```

<a name="cypher-neoquerybuilder-return-relationship"></a>
#### relationship
should pass.

```js
return queryBuilder["return"](['name', 'age'], true).toString().should.equal('RETURN r.name, r.age');
```

should pass.

```js
return queryBuilder["return"]({
  'name': 'Name',
  'age': 'Age'
}, true).toString().should.equal('RETURN r.name AS Name, r.age AS Age');
```

<a name="cypher-neoquerybuilder-union"></a>
### union
should pass.

```js
return queryBuilder.union('all').toString().should.equal('UNION ALL');
```

<a name="cypher-neoquerybuilder-using"></a>
### using
<a name="cypher-neoquerybuilder-using-without-param"></a>
#### without param
should pass.

```js
return queryBuilder.using('n:Swedish(surname)').toString().should.equal('USING n:Swedish(surname)');
```

<a name="cypher-neoquerybuilder-using-with-param"></a>
#### with param
should pass.

```js
return queryBuilder.using('n:Swedish(surname)', 'INDEX').toString().should.equal('USING INDEX n:Swedish(surname)');
```

<a name="cypher-neoquerybuilder-orderby"></a>
### orderBy
<a name="cypher-neoquerybuilder-orderby-node"></a>
#### node
should pass.

```js
return queryBuilder.orderBy('n.name').toString().should.equal('ORDER BY n.name');
```

should pass.

```js
return queryBuilder.orderBy(['name', 'age']).toString().should.equal('ORDER BY n.name, n.age');
```

should pass.

```js
return queryBuilder.orderBy({
  'name': 'asc',
  'age': 1,
  'gender': true
}).toString().should.equal('ORDER BY n.name ASC, n.age ASC, n.gender ASC');
```

<a name="cypher-neoquerybuilder-orderby-relationship"></a>
#### relationship
should pass.

```js
return queryBuilder.orderBy(['name', 'age'], true).toString().should.equal('ORDER BY r.name, r.age');
```

should pass.

```js
return queryBuilder.orderBy({
  'name': 'asc',
  'age': 1,
  'gender': true
}, true).toString().should.equal('ORDER BY r.name ASC, r.age ASC, r.gender ASC');
```

<a name="cypher-neoquerybuilder-skip"></a>
### skip
should pass.

```js
return queryBuilder.skip(1).toString().should.equal('SKIP 1');
```

<a name="cypher-neoquerybuilder-limit"></a>
### limit
should pass.

```js
return queryBuilder.limit(1).toString().should.equal('LIMIT 1');
```

should pass.

```js
return queryBuilder.limit(1, 2).toString().should.equal('LIMIT 1 SKIP 2');
```

<a name="cypher-neoquerybuilder-getfunctionlist"></a>
### getFunctionList
should pass.

```js
return queryBuilder.getList('function').should.deep.equal(['ALL', 'ANY', 'NONE', 'SINGLE', 'LENGTH', 'TYPE', 'ID', 'COALESCE', 'HEAD', 'LAST', 'TIMESTAMP', 'STARTNODE', 'ENDNODE', 'NODES', 'RELATIONSHIPS', 'LABELS', 'EXTRACT', 'FILTER', 'TAIL', 'RANGE', 'REDUCE', 'ABS', 'ACOS', 'ASIN', 'ATAN', 'COS', 'COT', 'DEGREES', 'E', 'EXP', 'FLOOR', 'HAVERSIN', 'LOG', 'LOG10', 'PI', 'RADIANS', 'RAND', 'ROUND', 'SIGN', 'SIN', 'SQRT', 'TAN', 'STR', 'REPLACE', 'SUBSTRING', 'LEFT', 'RIGHT', 'LTRIM', 'RTRIM', 'TRIM', 'LOWER', 'UPPER']);
```

<a name="cypher-neoquerybuilder-execute"></a>
### execute
should pass.

```js
var result;
true.should.be["true"];
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
<a name="main-create-new-connection-default-config"></a>
### Default config
should return default Neo4j connection.

```js
return neo.url.should.equal('http://localhost:7474');
```

<a name="main-create-new-connection-custom-config"></a>
### custom config
should return default Neo4j connection.

```js
return neo.url.should.equal('http://localhost:8484');
```

<a name="main-create-new-connection"></a>
## create new connection
should return default Neo4j setting.

```js
return neo.service().should.eventually.have.contain.keys('node', 'node_index', 'relationship_index', 'extensions_info');
```

<a name="node"></a>
# Node
<a name="node-createnode"></a>
## createNode
should pass.

```js
return neo.createNode({
  name: 'Kieve'
}).then(function(node) {
  node.should.have.property('name').equal('Kieve');
  return testNode = node;
});
```

<a name="node-readnode"></a>
## readNode
should pass.

```js
return neo.readNode(testNode._id).then(function(result) {
  return result.name.should.equal('Kieve');
});
```

<a name="node-updatenodeproperty"></a>
## updateNodeProperty
should pass.

```js
return Q.all([
  neo.updateNodeProperty(testNode._id, 'gender', 'male'), neo.updateNodeProperty(testNode._id, {
    'name': 'Kieve Chua',
    'age': 17
  })
]).then(function(result) {
  result[0].should.be["true"];
  return result[1].should.be["true"];
});
```

<a name="node-readnodeproperty"></a>
## readNodeProperty
should pass.

```js
return neo.readNodeProperty(testNode._id).then(function(result) {
  result.name.should.equal('Kieve Chua');
  return result.age.should.equal(17);
});
```

<a name="node-deletenodeproperty"></a>
## deleteNodeProperty
should pass.

```js
return Q.all([neo.deleteNodeProperty(testNode._id, 'name'), neo.deleteNodeProperty(testNode._id)]).then(function(result) {
  result[0].should.be["true"];
  return result[1].should.be["true"];
});
```

<a name="node-deletenode"></a>
## deleteNode
should pass.

```js
return neo.deleteNode(testNode._id).should.eventually.be["true"];
```

<a name="relationship"></a>
# Relationship
<a name="relationship-createrelationship"></a>
## createRelationship
should pass.

```js
return neo.createRelationship(testNode[0]._id, testNode[1]._id, 'friend', {
  since: '10 years ago'
}).then(function(relationship) {
  testRelationship = relationship;
  return relationship.since.should.equal('10 years ago');
});
```

<a name="relationship-readrelationship"></a>
## readRelationship
should pass.

```js
return neo.readRelationship(testRelationship._id).then(function(result) {
  return result.since.should.equal('10 years ago');
});
```

<a name="relationship-updaterelationshipproperty"></a>
## updateRelationshipProperty
should pass.

```js
return neo.updateRelationshipProperty(testRelationship._id, 'since', '11 years ago').then(function(result) {
  return result.should.be["true"];
});
```

should pass.

```js
return neo.updateRelationshipProperty(testRelationship._id, {
  'since': '12 years ago',
  'sinceAge': 17
}).then(function(result) {
  return result.should.be["true"];
});
```

<a name="relationship-readrelationshipproperty"></a>
## readRelationshipProperty
should pass.

```js
return neo.readRelationshipProperty(testRelationship._id).then(function(result) {
  result.since.should.equal('12 years ago');
  return result.sinceAge.should.equal(17);
});
```

<a name="relationship-readrelationshiptype"></a>
## readRelationshipType
should pass.

```js
return neo.readRelationshipType().then(function(result) {
  return result.should.include('friend');
});
```

<a name="relationship-readtypedrelationship"></a>
## readTypedRelationship
should pass.

```js
return Q.all([neo.readTypedRelationship(testNode[1]._id, 'all'), neo.readTypedRelationship(testNode[1]._id, 'in'), neo.readTypedRelationship(testNode[1]._id, 'out'), neo.readTypedRelationship(testNode[1]._id, 'all', 'friend'), neo.readTypedRelationship(testNode[1]._id, 'in', 'friend'), neo.readTypedRelationship(testNode[1]._id, 'out', 'friend'), neo.readTypedRelationship(testNode[1]._id, 'all', ['friend', 'lover'])]).then(function(result) {
  result[0].should.have.length(1);
  result[1].should.have.length(1);
  result[2].should.be.empty;
  result[3].should.have.length(1);
  result[4].should.have.length(1);
  result[5].should.be.empty;
  return result[6].should.have.length(1);
});
```

<a name="relationship-deleterelationshipproperty"></a>
## deleteRelationshipProperty
<a name="relationship-deleterelationshipproperty-delete-with-property"></a>
### delete with property
should pass.

```js
return neo.deleteRelationshipProperty(testRelationship._id, 'since').should.eventually.be["true"];
```

<a name="relationship-deleterelationshipproperty-delete-without-property"></a>
### delete without property
should pass.

```js
return neo.deleteRelationshipProperty(testRelationship._id).should.eventually.be["true"];
```

<a name="relationship-deleterelationship"></a>
## deleteRelationship
should pass.

```js
return neo.deleteRelationship(testRelationship._id).should.eventually.be["true"];
```

<a name="traversal"></a>
# Traversal
<a name="traversal-createpagedtraverse"></a>
## createPagedTraverse
should pass.

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
}).then(function(result) {
  return result.should.have.length.of.at.least(1);
});
```

<a name="traversal-traversepath"></a>
## traversePath
should pass.

```js
return neo.traversePath(testNode[0]._id, {
  "order": "breadth_first",
  "uniqueness": "none",
  "return_filter": {
    "language": "builtin",
    "name": "all"
  }
}).then(function(result) {
  return result.should.have.length.of.at.least(1);
});
```

<a name="traversal-traversenode"></a>
## traverseNode
should pass.

```js
return neo.traverseNode(testNode[0]._id, {
  "order": "breadth_first",
  "uniqueness": "none",
  "return_filter": {
    "language": "builtin",
    "name": "all"
  }
}).then(function(result) {
  return result.should.have.length.of.at.least(1);
});
```

<a name="traversal-pagedtraverse"></a>
## pagedTraverse
should pass.

```js
return neo.pagedTraverse(testNode[0]._id, {
  pageSize: 1
}).then(function(result) {
  return result.should.have.length.of.at.least(1);
});
```

<a name="utils"></a>
# Utils
<a name="utils-objtostr"></a>
## objToStr
should return stringify object.

```js
return utils.objToStr({
  name: 'kieve',
  age: 18
}).should.equal("{ name : 'kieve', age : '18' }");
```

