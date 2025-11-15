# Running Padnt with Docker

This document describes how to run the Padnt application using Docker and Docker Compose.

## Prerequisites

- Docker
- Docker Compose

## Running the Application

To run the application, navigate to the `docker` directory and follow these steps:

1. **Build the Docker Image:**
   
   From the `docker` directory, run the build script to create the image locally:
   
   ```bash
   ./build-image.sh
   ```
   
   This command will build the `padnt:latest` Docker image.

2. **Start the Container:**
   
   After the image is built, start the container with Docker Compose:
   
   ```bash
   docker compose up
   ```
   
   The command above will start the application container using the `padnt:latest` image built in the previous step.

3. **Access the Application:**
   
   Once the container is running, the application will be available at the following address:
   
   [http://localhost:8080](http://localhost:8080)

## Stopping the Application

To stop the application, press `Ctrl + C` in the terminal where `docker compose up` is running, or execute the following command from another terminal (inside the `docker` directory):

```bash
docker compose down
```

## Data Persistence

The application uses an H2 database to persist data. The data is stored in the `docker/padnt-data` directory, which is created the first time the container starts. This directory is mapped to the container, ensuring that data is not lost, and it is configured to be ignored by Git via the `docker/.gitignore` file.



**Note:** The `padnt-data` directory is created inside the `docker` folder, in the same location as the `docker-compose.yml` file. If you move the Docker files to another location and want to preserve existing data, remember to move the `padnt-data` directory as well.
