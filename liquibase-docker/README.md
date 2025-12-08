# Custom Liquibase Docker Image for PostgreSQL

1. Download the PostgreSQL JDBC driver:
   ```sh
   curl -L -o postgresql.jar https://jdbc.postgresql.org/download/postgresql-42.6.0.jar
   ```
2. Build the Docker image:
   ```sh
   docker build -t ghcr.io/<your-github-username>/liquibase-postgres:latest .
   ```
3. Push the image to your registry:
   ```sh
   docker push ghcr.io/<your-github-username>/liquibase-postgres:latest
   ```
4. Update your Liquibase Job manifest to use this image.
