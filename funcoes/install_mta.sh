InstallMTA () {
echo -n "Instalando Dovecot"
echo "dovecot-core dovecot-core/create-ssl-cert boolean false" | debconf-set-selections
echo "dovecot-core dovecot-core/ssl-cert-name string $CFG_HOSTNAME_FQDN" | debconf-set-selections
apt-get install -y dovecot-imapd dovecot-pop3d dovecot-sieve dovecot-mysql dovecot-lmtpd opendkim opendkim-tools
echo -e "[${green}FEITO!${NC}]\n"
}
