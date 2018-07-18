InstallISPConfig () {
echo -n "Instalando ISPConfig 3.1"
cd /tmp/
wget https://ispconfig.org/downloads/ISPConfig-3.1.12.tar.gz
tar xvzf ISPConfig-3.1.12.tar.gz
cd ispconfig3_install/install/
echo "Criando arquivo .ini"
touch autoinstall.ini
echo "[install]" > autoinstall.ini
echo "language=en" >> autoinstall.ini
	  echo "install_mode=standard" >> autoinstall.ini
	  echo "hostname=$CFG_HOSTNAME_FQDN" >> autoinstall.ini
	  echo "mysql_hostname=localhost" >> autoinstall.ini
	  echo "mysql_root_user=root" >> autoinstall.ini
	  echo "mysql_root_password=$CFG_MYSQL_ROOT_PWD" >> autoinstall.ini
	  echo "mysql_database=dbispconfig" >> autoinstall.ini
	  echo "mysql_charset=utf8" >> autoinstall.ini
		echo "http_server=apache" >> autoinstall.ini
	  echo "ispconfig_port=8080" >> autoinstall.ini
	  echo "ispconfig_use_ssl=y" >> autoinstall.ini
	  echo
	  echo "[ssl_cert]" >> autoinstall.ini
	  echo "ssl_cert_country=IT" >> autoinstall.ini
	  echo "ssl_cert_state=Italy" >> autoinstall.ini
	  echo "ssl_cert_locality=Udine" >> autoinstall.ini
	  echo "ssl_cert_organisation=Servisys di Temporini Matteo" >> autoinstall.ini
	  echo "ssl_cert_organisation_unit=IT department" >> autoinstall.ini
	  echo "ssl_cert_common_name=$CFG_HOSTNAME_FQDN" >> autoinstall.ini

          echo | php -q install.php --autoinstall=autoinstall.ini

          service apache2 restart
}
