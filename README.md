CWLY
====

## Document Index

```
curl https://cwgl.herokuapp.com?format=json
```

Search by text 'Project Name':

```
curl -G --data-urlencode 'qs={"info":{"name":"Project Name"}}' --data-urlencode 'format=json' https://cwgl.herokuapp.com
```

Search by values 'carbon' OR 'cubic':

```
curl -G --data-urlencode 'qv={"info":{"tags":["carbon","cubic"]}}' --data-urlencode 'format=json' https://cwgl.herokuapp.com
```

## Document

Request:

```
curl --data-urlencode 'url=https://crystalwalk.herokuapp.com' --data-urlencode 'data={"s":"hello","p":2,"q":3}' https://cwgl.herokuapp.com/add
```

Response:

```json
{"slug":"a"}
```

## Short URL

Request:

```
http://cw.gl/a
```

URL redirection:

```
http://crystalwalk.herokuapp.com/#a
```

## Data

Request:

```
http://cw.gl/a.json
```

Response:

```json
{"data":{"name":"Hello","title":"World"}}
```

## Files

```
curl --data-urlencode 'url=https://crystalwalk.herokuapp.com' --data-urlencode 'data={"files":{"txt":"aGVsbG8K"}}' https://cwgl.herokuapp.com/add
```

```
curl -vvv https://cwgl.herokuapp.com/….txt
# => hello
```
