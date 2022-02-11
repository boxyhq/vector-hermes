# Vector Docker

## Install

```
git clone https://github.com/devkiran/vector-hermes.git
```

```
cd vector-hermes
```

```
docker-compose up --build
```

## ClickHouse Web UI

Web UI can be accessed here [http://localhost:8123/play](http://localhost:8123/play)

Create Database

```
CREATE DATABASE hermes;
```

Create Table

```
CREATE TABLE hermes.auditlogs
(
   actor String,
   actor_type String,
   group String,
   where String,
   where_type String,
   when String,
   target String,
   target_id String,
   action String,
   action_type String,
   name String,
   description String
) ENGINE = Log
```

SELECT Audit Logs

```
SELECT * FROM hermes.auditlogs;
```

## Ingest Audit Log

```
curl --header "Content-Type: application/json" \
  --request POST \
  --data '{
      "actor":"john-doe",
      "actor_type":"user",
      "group":"boxyhq",
      "where":"127.0.0.1",
      "where_type":"ip",
      "when":"2021-05-18T20:53:39+01:00",
      "target":"user.login",
      "target_id":"10",
      "action":"login",
      "action_type":"U",
      "name":"user.login",
      "description":"This is a login event",
      "metadata":{
         "foo":"bar",
         "hey":"you"
      }
    }' \
  http://127.0.0.1:3000
```

## Apache Bench

```
ab -n 100 -c 10 -p data.json -T application/json http://127.0.0.1:3000/
```