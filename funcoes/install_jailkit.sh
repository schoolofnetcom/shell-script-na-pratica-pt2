InstallJailkit () {
echo -n "Instalando Jailkit"
sudo apt-get install build-essential autoconf automake libtool flex bison debhelper binutils-gold
cd /tmp
wget https://olivier.sessink.nl/jailkit/jailkit-2.19.tar.gz
tar xvzf jailkit-2.19.tar.gz
cd  jailkit-2.19
./debian/rules binary
cd /tmp/
dpkg -i jailkit_2.19-1*.deb
echo -e "[${green}FEITO!${NC}]\n"
}
