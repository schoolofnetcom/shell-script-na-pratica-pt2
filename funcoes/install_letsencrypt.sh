InstallLetsEncrypt (){
echo -n "Instalando LetsEncrypt"
apt-get -y install letsencrypt
echo -e "[${green}FEITO!${NC}]\n"
}
