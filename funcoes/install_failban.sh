#---------------------------------------------------------------------
InstallFail2ban() {
  echo -n "Instalando Fail2ban"
  apt-get -y install fail2ban

	
cat > /etc/fail2ban/jail.local <<EOF
[pureftpd]
enabled  = true
port     = ftp
filter   = pureftpd
logpath  = /var/log/syslog
maxretry = 3

[dovecot-pop3imap]
enabled = true
filter = dovecot-pop3imap
action = iptables-multiport[name=dovecot-pop3imap, port="pop3,pop3s,imap,imaps", protocol=tcp]
logpath = /var/log/mail.log
maxretry = 5

[postfix-sasl]
enabled  = true
port     = smtp
filter   = postfix-sasl
logpath  = /var/log/mail.log
maxretry = 3
EOF

cat >> /etc/fail2ban/filter.d/dovecot-pop3imap.conf <<EOF
[Definition]
failregex = (?: pop3-login|imap-login): .*(?:Authentication failure|Aborted login \(auth failed|Aborted login \(tried to use disabled|Disconnected \(auth failed|Aborted login \(\d+ authentication attempts).*rip=(?P<host>\S*),.*
ignoreregex =
EOF

cat > /etc/fail2ban/filter.d/pureftpd.conf <<EOF
[Definition]
failregex = .*pure-ftpd: \(.*@<HOST>\) \[WARNING\] Authentication failed for user.*
ignoreregex =
EOF

echo "ignoreregex =" >> /etc/fail2ban/filter.d/postfix-sasl.conf

  service fail2ban restart
  echo -e "[${green}Feito!!${NC}]\n"
}

