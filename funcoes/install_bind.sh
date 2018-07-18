InstallBind () {
echo -n "Instalando DNS"
apt-get -y install bind9 dnsutils haveged

echo -e "[${green}FEITO!${NC}]\n"
}


