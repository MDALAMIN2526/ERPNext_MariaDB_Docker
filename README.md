# ERPNext MariaDB Docker

### Description The ERPNext MariaDB Docker repository provides a Docker image tailored for managing ERPNext sites' databases. It offers a streamlined solution for deploying the database component of ERPNext.

### Contents Dockerfile: Defines the instructions for building the ERPNext MariaDB Docker image. README.md: Contains detailed information on how to use the Docker image and other important instructions. LICENSE: Specifies the license under which the repository is distributed.

## Usage

### Pull the image from the Docker Hub: docker pull amin252646778/erpnext_mariadb:latest

    Run a container based on the image: docker run -d --name erpnext-mariadb-container amin252646778/erpnext_mariadb:latest

### Access the MariaDB server within the container: 

    docker exec -it erpnext-mariadb-container mysql -u root -p 

### Features Provides a ready-to-use Docker image for MariaDB, specifically tailored for ERPNext. Offers versioning for easy tracking of updates and changes. Simplifies deployment and management of ERPNext databases. Contribution Guidelines Contributions to the ERPNext MariaDB Docker repository are welcome. Please follow these guidelines when contributing:

### Fork the repository and create a new branch for your changes. Ensure that your code adheres to the coding standards. Submit a pull request with a clear description of your changes. License This repository is licensed under the MIT License.

## Maintainer Md. Al-Amin

### Email: amin252646@gmail.com This repository overview provides a brief summary of the ERPNext MariaDB Docker repository, including its purpose, contents, usage instructions, features, contribution guidelines, license, and maintainer details. Feel free to customize it further as needed.
