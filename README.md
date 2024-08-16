# Simple Nginx Directory Listing Server

*Author: @yoiqsram*

## Overview

This project uses Docker Compose to run a simple web server based on Nginx, which serves as a directory listing for file transfers. The server is designed to be accessible within a local network without requiring any client-side configuration.

### Background

The primary goal of this project is to enable easy file transfer between devices within the same network. To achieve this, we utilize Docker Compose to manage and run an Nginx web server in a containerized environment. This setup allows for flexibility and portability while keeping the configuration simple.

## Configuration and Setup

### Directory Bindings

To serve specific directories from your local machine, you need to add bindings to the `docker-compose.yaml` file. For example, to make the `images` directory available at `/www/data/images`, you would add:

```yaml
volumes:
  - ./images:/www/data/images
```

### Docker Image Build and Container Start

To build the Docker image, run the command:

```bash
docker compose build
```

To start the container in detached mode (i.e., running it in the background), you can use either of the following commands:

- `docker compose up --detach`
- Alternatively, to also rebuild the image if necessary, use: `docker compose up --build --detach`

### Project Name Renaming

For better organization and identification within Docker Compose, consider renaming your project using a command like this (replace "awesome-project" with your desired name):

```bash
docker compose --project-name awesome-project up --detach
```

## Basic Authentication

The Nginx server used in this setup includes basic authentication. By default, the username is set to "admin," and the password is "iamtheadmin." These credentials are used for authenticating users before granting access to the directory listings.

### Adding New Users

To add new users manually, you would use the following command inside your running container:

```bash
docker exec -t CONTAINER_NAME echo USERNAME:$(openssl passwd PASSWORD) >> /etc/nginx/.htpasswd
```

Replace `CONTAINER_NAME` with the actual name of your container, and update `USERNAME` and `PASSWORD` accordingly. Note that this documentation does not cover advanced security measures beyond basic authentication.

## Usage Instructions

### Accessing the Server

1. Ensure Docker Compose is installed on your system.
2. Place your desired directories (e.g., images) within the same directory as the `docker-compose.yaml` file, or specify their paths according to the volume bindings in the configuration file.
3. Run commands to build and start the container as described above.

### Accessing File Transfer Web Interface

After running the server successfully:
1. Open a web browser on your client device.
2. Navigate to the address where the Nginx server is accessible (by default at `http://localhost:8080`, but this could be change in the `docker-compose.yaml`).
3. You will be prompted for authentication using the default username "admin" and password "iamtheadmin."
4. Once authenticated, you should see a directory listing of the shared directories.

## Limitations and Future Work

This project is designed with simplicity in mind, focusing on basic file transfer functionality within a local network environment. It does not cover advanced security features or optimizations suitable for larger-scale applications.
