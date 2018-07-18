
InstallWebServer() {
if [ $CFG_WEBSERVER == 'apache' ]; then
echo -n 'Instalando Apache e seus modulos'
apt-get -yqq install apache2 apache2-doc  apache2-utils libapache2-mod-php libapache2-mod-fastcgi libapache2-mod-fcgid apache2-suexec-custom libapache2-mod-passenger libapache2-mod-python libexpat1 ssl-cert libruby
echo -e "[${green}FEITO!${NC}]\n"
	echo -n "Instalando PHP e seus módulos "
	apt-get -yqq install php7.0 php7.0-common php7.0-gd php7.0-mysql php7.0-imap php7.0-cli php7.0-cgi php-pear php-auth php7.0-mcrypt mcrypt imagemagick libruby php7.0-curl php7.0-intl php7.0-pspell php7.0-recode php7.0-sqlite3 php7.0-tidy php7.0-xmlrpc php7.0-xsl memcached php-memcache php-imagick php-gettext php7.0-zip php7.0-mbstring php7.0-fpm php7.0-opcache php-apcu
	echo -e "[${green}FEITO!${NC}]\n"
	echo -n "Instalando complementos para PHP e o Apache "
	apt-get -yqq install mcrypt imagemagick memcached curl tidy snmp
    echo -e "[${green}FEITO!${NC}]\n"

echo -n 'Habilitando modulos do Apache'
a2enmod suexec
a2enmod rewrite
a2enmod ssl
a2enmod dav_fs
a2enmod dav
a2enmod auth_digest
a2enmod fastcgi
a2enmod fcgid
a2enmod alias
service apache2 restart
echo -e "[${green}FEITO!${NC}]\n"

else

echo -n 'Instalando Nginx'
service apache2 stop
update-rc.d -f apache2 remove
apt-get -yqq install ngnix
service nginx restart
echo -n 'Instalando PHP e seus modulos'
apt-get -yqq install php7.0 php7.0-common php7.0-gd php7.0-mysql php7.0-imap php7.0-cli php7.0-cgi php-pear php-auth php7.0-mcrypt mcrypt imagemagick libruby php7.0-curl php7.0-intl php7.0-pspell php7.0-recode php7.0-sqlite3 php7.0-tidy php7.0-xmlrpc php7.0-xsl memcached php-memcache php-imagick php-gettext php7.0-zip php7.0-mbstring php7.0-fpm php7.0-opcache php-apcu
echo -n 'Alterando PHP.INI'
sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/7.0/fpm/php.ini
service php7.0-fpm reload
echo -n 'Instalando complemente PHP'
apt-get -yqq install fcgiwrap
echo -e "[${green}FEITO!${NC}]\n"
fi
}


