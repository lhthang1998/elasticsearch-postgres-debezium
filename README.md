# Sync Postgres to  Elasticsearch

### Reference
- https://debezium.io/documentation/reference/stable/connectors/postgresql.html#postgresql-adding-connector-configuration
- https://debezium.io/blog/2018/01/17/streaming-to-elasticsearch/
- https://github.com/debezium/debezium-examples/blob/main/unwrap-smt/es-sink.json

### How to set up
- Run `./start.sh` to start project
- Run `./stop.sh` to clean project


### List tables sync
- "table.exclude.list": "public.users", in `source.json` defines which tables are not streamed to elasticsearch