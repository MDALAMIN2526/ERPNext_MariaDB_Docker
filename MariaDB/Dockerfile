# Use the official MariaDB base image
FROM mariadb:10.6

# Set image metadata as labels
LABEL maintainer="Md.Al-Amin <amin252646@gmail.com>" \
      org.opencontainers.image.title="ERPNext MariaDB" \
      org.opencontainers.image.description="This Docker image offers a streamlined solution for deploying ERPNext's database component." \
      org.opencontainers.image.version="1.0.0" \
      org.opencontainers.image.vendor="CodeProMax Tech" \
      org.opencontainers.image.url="https://hub.docker.com/r/codepromaxtech/erpnext_mariadb" \
      org.opencontainers.image.documentation="https://github.com/MDALAMIN2526/ERPNext_MariaDB_Docker/blob/main/README.md" \
      org.opencontainers.image.source="https://github.com/MDALAMIN2526/ERPNext_MariaDB_Docker"

# Set environment variables to avoid user prompts during installation
ENV MYSQL_ROOT_PASSWORD=asdf@1234

# Copy the custom configuration file
COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Expose the default MariaDB port
EXPOSE 3306
