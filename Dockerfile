# Use an official Ubuntu base image
FROM ubuntu:22.04

# Set environment variables to avoid user prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list, install software-properties-common, and MariaDB server
RUN apt-get update && \
    apt-get install -y software-properties-common mariadb-server && \
    rm -rf /var/lib/apt/lists/*

# Set environment variables for the MariaDB root password
ENV MYSQL_ROOT_PASSWORD=asdf@1234

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
