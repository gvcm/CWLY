# CWLY: CrystalWalk URL Shortener and persistence API

CrystalWalk is a web-based 3D interactive crystal editor and visualization software designed for teaching materials science and engineering aiming to provide an easy to use and accessible platform to students, professors and researchers. Additional project information is available at its official page http://gvcm.ipen.br/CrystalWalk, including contributors and team members, documentation, research premises, step-by-step guides and videos as well reaching the authors regarding any questions, comments, or concerns.


Software architecture is composed by the 3 specific applications CWAPP, CWLY, CW4P. 

CWAPP: is CrystalWalk's main application component based in HTML5/WebGL.

CWLY: is the URL Shortener and persistence API

CW4P: design pattern that implements event-oriented paradigm for WebGL technology, foundation of the main CrystalWalk application (CWAPP)


Additionally, CWD3 is a dynamic data visualization platform built using D3 to gather insights and support the systematic review analysis of the crystallographic software.

CrystalWalk is open-source licensed under the MIT license.

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
