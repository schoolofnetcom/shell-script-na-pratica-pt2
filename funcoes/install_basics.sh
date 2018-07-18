#---------------------------
# Function: InstallBasics
# Atualizar pacotes basicos
#---------------------------

InstallBasics() {
echo -n "Atualizando repositorios e pacotes"
apt-get -qq update > /dev/null 2>&1
apt-get -qq upgrade > /dev/null 2>&1
echo -e "[${green}Feito!${NC}]\n"

echo -n "Instalando pacotes basicos"
apt-get -y install ssh openssh-server ntp ntpdate debconf-utils binutils sudo git > /dev/null 2>&1
service apparmor stop
update-rc.d -f apparmor remove
apt-get -y remove apparmor apparmor-utils

echo "dash dash/sh boolean false" | debconf-set-selections
dpkg-reconfigure -f nointeractive dash > /dev/null 2>&1
echo -n "Reconfigurando dash"
echo -e "[${green}Feito!${NC}]\n" 
}
