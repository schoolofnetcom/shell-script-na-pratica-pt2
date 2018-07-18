InstallWebmail() {
 echo -n "Instalando cliente de e-mail"
	  CFG_ROUNDCUBE_PWD='schoolofnet'
	  echo "roundcube-core roundcube/dbconfig-install boolean true" | debconf-set-selections
	  echo "roundcube-core roundcube/database-type select mysql" | debconf-set-selections
	  echo "roundcube-core roundcube/mysql/admin-pass password $CFG_MYSQL_ROOT_PWD" | debconf-set-selections
	  echo "roundcube-core roundcube/db/dbname string roundcube" | debconf-set-selections
	  echo "roundcube-core roundcube/mysql/app-pass password $CFG_ROUNDCUBE_PWD" | debconf-set-selections
	  echo "roundcube-core roundcube/app-password-confirm password $CFG_ROUNDCUBE_PWD" | debconf-set-selections
	  echo "roundcube-core roundcube/hosts string localhost" | debconf-set-selections
	  apt-get -y install roundcube roundcube-core roundcube-mysql roundcube-plugins roundcube-plugins-extra javascript-common libjs-jquery-mousewheel php-net-sieve tinymce

if [ "$CFG_WEBSERVER" == "apache" ]; then
	  service apache2 restart
 else
	  service nginx restart
fi
  echo -e "[${green}Feito!!${NC}]\n"
}

