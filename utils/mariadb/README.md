# Optimized option for a mysql container

This is a easy to setup and run a mysql db

## RUN on server

```bash
docker compose up -d
```

## RUN and view logs

```bash
docker compose up
```

## Things to know
The data is saved and persistent in a local `./data` folder where the `docker-compose.yml` file resides.

## Auth

authentication is setted up with the following user:

| field | value |
| --- | --- |
| MYSQL_ROOT_PASSWORD | toor |
| MYSQL_DATABASE | db |
| MYSQL_USER | luther |
| MYSQL_PASSWORD | luther |


## Attach to it from a CLI client

mysql --protocol TCP -h localhost -u luther --password=luther db
