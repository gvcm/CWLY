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
curl --data 'url=https%3A%2F%2Fcrystalwalk.herokuapp.com&data=%7B%22s%22%3A%22hello%22%2C%22p%22%3A2%2C%22q%22%3A3%7D' https://cwgl.herokuapp.com/add
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
