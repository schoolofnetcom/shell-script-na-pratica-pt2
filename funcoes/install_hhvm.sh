InstallHHVM () {
echo -n "Instalando HHVM"
apt-get install -y software-properties-common apt-transport-https
apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xB4112585D386EB94

add-apt-repository "https://dl.hhvm.com/ubuntu xenial main"
apt-get update
apt-get -y install hhvm
echo -e "[${green}FEITO!${NC}]\n"
}
