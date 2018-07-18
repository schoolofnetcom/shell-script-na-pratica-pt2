InstallWebStats() {
  echo -n "Instalando Utilitario de estatisticas ";
  apt-get -y install vlogger webalizer awstats geoip-database libclass-dbi-mysql-perl
  sed -i 's/^/#/' /etc/cron.d/awstats
  echo -e "[${green}Feito!!${NC}]\n"
}
