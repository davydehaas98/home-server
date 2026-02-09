https://henrywithu.com/upgrade-postgresql-from-17-to-18-on-docker/

docker exec authentik-postgres pg_dumpall -U authentik > backup.sql

docker stop authentik-server authentik-worker
docker stop authentik-postgres

mv ./authentik-postgres ./authentik-postgres-old

REMOVE /data from volume

      - ~/home-server/authentik/postgres:/var/lib/postgresql/data:rw
      - ~/home-server/authentik/postgres:/var/lib/postgresql:rw



docker exec -i authentik-postgres psql -U authentik -d authentik < backup.sql
