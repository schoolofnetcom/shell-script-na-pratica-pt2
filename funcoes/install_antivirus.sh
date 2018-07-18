InstallAntiVirus() {
  echo -n "Instalando Utilitarios de antivirus..."
  apt-get -y install amavisd-new spamassassin clamav clamav-daemon zoo unzip bzip2 arj nomarch lzop cabextract apt-listchanges libnet-ldap-perl libauthen-sasl-perl clamav-docs daemon libio-string-perl libio-socket-ssl-perl libnet-ident-perl zip libnet-dns-perl rkhunter

sed -i "s/AllowSupplementaryGroups false/AllowSupplementaryGroups true/" /etc/clamav/clamd.conf
echo -n "Parando Spam Assassin"
service spamassassin stop
update-rc.d -f spamassassin remove

echo -n "Reiniciando ClamAV"
service clamav-daemon restart
echo -e "[${green}FEITO!${NC}]\n"

}

