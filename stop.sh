#!/bin/bash
curl -i -X DELETE -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:8083/connectors/es-sink-users-1
curl -i -X DELETE -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:8083/connectors/es-sink-posts-1
curl -i -X DELETE -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:8083/connectors/test_db-connector-1

docker-compose down && docker volume prune -f
rm -rf elasticsearch
rm -rf postgres
echo 'Clean project successfully'