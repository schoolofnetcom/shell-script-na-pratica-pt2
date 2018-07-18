
InstallSQLServer() {
if [ "$CFG_SQLSERVER" == "MySQL" ]; then
echo -n "Instalando MySQL Server"
echo "mysql-server-5.7 mysql-server/root_password password $CFG_MYSQL_ROOT_PWD" | debconf-set-selections
echo "mysql-server-5.7 mysql-server/root_password_again password $CFG_MYSQL_ROOT_PWD" | debconf-set-selections
apt-get -y install mysql-server-5.7 mysql-client-5.7
sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
service mysql restart
echo -e "[${green}FEITO!${NC}]\n"


else

echo -n "Instalando MariaDB Server"
echo "mysql-server-5.7 mysql-server/root_password password $CFG_MYSQL_ROOT_PWD" | debconf-set-selections
echo "mysql-server-5.7 mysql-server/root_password_again password $CFG_MYSQL_ROOT_PWD" | debconf-set-selections
apt-get -y install mariadb-client mariadb-server
sed -i '$ a bind-address = 0.0.0.0' /etc/mysql/conf.d/mysql.cnf
service mysql restart
echo -e "[${green}FEITO!${NC}]\n"
fi
}

