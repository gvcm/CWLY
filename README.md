CWLY
====

## Document Index

```
curl https://cwgl.herokuapp.com?format=json
```

Search by name "Project Name" (```qs={"info":{"name":"Project Name"}}```):

```
curl https://cwgl.herokuapp.com?format=json&qs=%7B%22info%22:%7B%22name%22:%22Project%20Name%22%7D%7D
```

Search by tags 'carbon' OR 'cubic' (```qv={"info":{"tags":["carbon","cubic"]}}```):

```
curl https://cwgl.herokuapp.com?format=json&qv=%7B%22info%22:%7B%22tags%22:[%22carbon%22,%22cubic%22]%7D%7D
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
