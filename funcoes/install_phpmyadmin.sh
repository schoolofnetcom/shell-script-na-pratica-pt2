
InstallPHPMyAdmin() {
if [ $CFG_WEBSERVER == 'apache' ]; then
echo -n 'Instalando e configurando o PHP My Admin com o Apache'
echo "phpmyadmin phpmyadmin/internal/skip-preseed boolean true" | debconf-set-selections
echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
echo "phpmyadmin phpmyadmin/app-pass password $APP_DB_PASS" | debconf-set-selections
echo "phpmyadmin phpmyadmin/app-password-confirm password $APP_PASS" | debconf-set-selections
echo "phpmyadmin phpmyadmin/admin-password password $ROOT_PASS" | debconf-set-selections
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2" | debconf-set-selections
apt-get install -y phpmyadmin

else

echo -n 'Instalando e configurando o PHP My Admin com o Nginx'
echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selecti
ons
echo "phpmyadmin phpmyadmin/app-pass password $APP_DB_PASS" | debconf-set-selections
echo "phpmyadmin phpmyadmin/app-password-confirm password $APP_PASS" | debconf-set-selections
echo "phpmyadmin phpmyadmin/admin-password password $ROOT_PASS" | debconf-set-selections
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect none" | debconf-set-selections
apt-get install -y phpmyadmin
fi
}
