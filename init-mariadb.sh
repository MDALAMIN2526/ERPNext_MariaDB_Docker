#!/bin/bash

# Initialize the MariaDB data directory if it hasn't been initialized
if [ ! -d "/var/lib/mysql/mysql" ]; then
    mariadb-install-db --user=mysql --ldata=/var/lib/mysql > /dev/null

    # Start MariaDB temporarily
    mysqld_safe --skip-networking &

    # Wait for the server to start
    while ! mysqladmin ping --silent; do
        sleep 1
    done

    # Secure MariaDB installation
    mysql --execute="UPDATE mysql.user SET plugin = 'mysql_native_password' WHERE User = 'root';"
    mysql --execute="SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${MYSQL_ROOT_PASSWORD}');"
    mysql --execute="DELETE FROM mysql.user WHERE User='';"
    mysql --execute="DROP DATABASE IF EXISTS test;"
    mysql --execute="DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';"
    mysql --execute="FLUSH PRIVILEGES;"

    # Stop MariaDB
    mysqladmin shutdown
fi

# Start MariaDB server
exec "$@"
