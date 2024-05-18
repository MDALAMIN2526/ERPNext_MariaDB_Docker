# Use an official Ubuntu base image
FROM ubuntu:22.04
# Set image metadata as labels
LABEL maintainer="Md.Al-Amin <amin252646@gmail.com>"
LABEL org.opencontainers.image.title="ERPNext MariaDB"
LABEL org.opencontainers.image.description="This Docker image offers a streamlined solution for deploying ERPNext's database component."
LABEL org.opencontainers.image.version="1.0.0"
LABEL org.opencontainers.image.vendor="CodeProMax Tech"
LABEL org.opencontainers.image.url="https://hub.docker.com/r/amin252646778/erpnext_mariadb"
LABEL org.opencontainers.image.documentation="https://github.com/MDALAMIN2526/ERPNext_MariaDB_Docker/blob/main/README.md"
LABEL org.opencontainers.image.source="https://github.com/MDALAMIN2526/ERPNext_MariaDB_Docker"
# Set environment variables to avoid user prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list, install software-properties-common, and MariaDB server
RUN apt-get update && \
    apt-get install -y software-properties-common mariadb-server && \
    rm -rf /var/lib/apt/lists/*

# Set environment variables for the MariaDB root password
ENV MYSQL_ROOT_PASSWORD=asdf@1234
# Copy the custom configuration file
COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
# Copy the initialization script
COPY init-mariadb.sh /usr/local/bin/

# Make the script executable
RUN chmod +x /usr/local/bin/init-mariadb.sh

# Expose the default MariaDB port
EXPOSE 3306

# Use a custom entrypoint to initialize and start MariaDB
ENTRYPOINT ["/usr/local/bin/init-mariadb.sh"]

# Start MariaDB server
CMD ["mysqld_safe"]
