# Vector Docker

## Install

```
cd vector-hermes
```

```
docker run \
  --rm \
  -v "/$(pwd)/etc/vector:/etc/vector" \
  -p 3000:3000 \
  --entrypoint /etc/vector/entrypoint.sh \
  timberio/vector:0.20.0-debian
```

## Log Ingestion

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
ab -n 10000 -c 200 -p data.json -T application/json http://127.0.0.1:3000/
```