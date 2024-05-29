# Inception Project

## Summary

This project aims to broaden your knowledge of system administration by using Docker. You will virtualize several Docker images, creating them in your new personal virtual machine.

## Project Structure

The project consists of setting up a small infrastructure composed of different services under specific rules. The infrastructure includes:

- A Docker container with NGINX and TLSv1.2 or TLSv1.3
- A Docker container with WordPress + php-fpm
- A Docker container with MariaDB
- Volumes for WordPress database and website files
- A Docker network connecting all containers

## Prerequisites

- Virtual Machine (VM) setup
- Docker and Docker Compose installed on the VM

## Installation

1. Clone the repository to your VM:
    ```sh
    git clone https://github.com/Arnaud212/Inception.git
    cd Inception
    ```

2. Ensure all required files are in the `srcs` folder:
    ```sh
    srcs/
    ├── docker-compose.yml
    ├── .env
    ├── requirements/
    │   ├── mariadb/
    │   │   ├── Dockerfile
    │   │   └── conf/
    │   ├── nginx/
    │   │   ├── Dockerfile
    │   │   └── conf/
    │   ├── wordpress/
    │   │   ├── Dockerfile
    │   │   └── conf/
    │   └── tools/
    ```

3. Edit the `.env` file with your environment variables:
    ```sh
    DOMAIN_NAME=domain_name.fr
    MYSQL_ROOT_PASSWORD=your_root_password
    MYSQL_USER=your_mysql_user
    MYSQL_PASSWORD=your_mysql_password
    ```

## Usage

1. Build and start the Docker containers using the Makefile:
    ```sh
    make
    ```

2. Ensure the services are running:
    ```sh
    docker-compose ps
    ```

3. Access your WordPress site via `https://domain_name.fr`

## Notes

- Ensure your domain name points to your local IP address.
- Do not store sensitive information (e.g., passwords) in your Dockerfiles.
- Use environment variables and a `.env` file for configuration.

## Troubleshooting

- If containers are not starting, check the logs for errors:
    ```sh
    docker-compose logs
    ```

- Ensure all Dockerfiles and configurations are correct and meet the specified requirements.

## Submission and Peer-evaluation

Follow the instructions provided in the project documentation for submission and peer-evaluation.

