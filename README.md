CWGL
====

## Document

Request:

```
curl --data 'url=http://crystalwalk.herokuapp.com&data="{\"name\":\"Hello\",\"title\":\"World\"}"' https://cwgl.herokuapp.com/add
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
