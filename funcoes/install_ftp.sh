
InstallFTP() {
echo -n 'Instalando Pure FTP'
echo "pure-ftpd-common pure-ftpd/virtual_chroot boolean true" | debconf-set-selections
apt-get -yqq install pure-ftpd-common pure-ftpd-mysql
sed -i "s/STANDALONE_OR_INETD=.*/STANDALONE_OR_INETD=standalone/" /etc/default/pure-ftpd-common
echo 1 > /etc/pure-ftpd/conf/TLS
mkdir -p /etc/ssl/private/
openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem -subj "/C=$SSL_COUNTRY/ST=$SSL_STATE/L=$SSL_LOCALITY/O=$SSL_ORGANIZATION/OU=$SSL_ORGUNIT/CN=$CN"
chmod 600 /etc/ssl/private/pure-ftpd.pem
service pure-ftpd-mysql restart
echo -e "[${green}FEITO!${NC}\n"
}
