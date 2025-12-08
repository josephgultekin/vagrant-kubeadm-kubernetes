FROM liquibase/liquibase:5.0.1-alpine
ADD postgresql.jar /liquibase/drivers/postgresql.jar
COPY entrypoint.sh /liquibase/entrypoint.sh
# IMPORTANT: Ensure entrypoint.sh is executable before build:
# chmod +x liquibase-docker/entrypoint.sh
RUN mkdir -p /liquibase/changelogs
COPY liquibase.properties /liquibase/liquibase.properties
ENTRYPOINT ["/liquibase/entrypoint.sh"]