#!/bin/bash
waitForHealth() {
  echo "Checking if elasticsearch is available"
  i=0
  max_attempts=20
  while [[ $i -lt $max_attempts ]]
  do
    if [[ $(curl -k -s -o /dev/null -w %{http_code} http://localhost:9200/_cat/indices) = 200 ]]; then
      echo
      break
    fi
    i="$((i+1))"
    printf '.'
    sleep 2
  done
}

createTopicsAndConnectors() {
  curl -i -X PUT -u elastic:test -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:9200/users -d @reqs/mappings/users.json
  curl -i -X PUT -u elastic:test -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:9200/posts -d @reqs/mappings/posts.json

  # setup connections

  curl -i -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:8083/connectors/ -d @reqs/connections/es-sink-users.json
  curl -i -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:8083/connectors/ -d @reqs/connections/es-sink-posts.json
  curl -i -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:8083/connectors/ -d @reqs/connections/source.json

}

start() {
  echo "Start project...."
  docker-compose -f docker-compose.yml up -d
  waitForHealth
  createTopicsAndConnectors
}

start
