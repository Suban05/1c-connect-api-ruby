# [1C-Connect API client](https://1c-connect.atlassian.net/wiki/spaces/PUBLIC/pages/979042378)

## Usage

* Get your login and password from https://cus.buhphone.com/

## Quickstart

Library implements web-service api and http-service api.

### Web-service

```rb
require 'connect'

api = Connect::WebService::Client.new(login: 'login', password: 'password')
```

### HTTP-service

```rb
require 'connect'

api = Connect::HTTPService::Client.new(login: 'login', password: 'password')
```
