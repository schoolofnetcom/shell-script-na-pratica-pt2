#!/usr/bin/env bash

#Bash Color
red='\033[0;31m'
green='\033[0;32m'
NC='\033[0m' #sem cor

#Variaveis Globais

CFG_HOSTNAME_FQDN='shell_script2.movingcloud.com.br'
CFG_MYSQL_ROOT_PWD='schoolofnet'
APP_PASS="schoolofnet"
ROOT_PASS="schoolofnet"
APP_DB_PASS="schoolofnet"
SSL_COUNTRY="BR"
SSL_STATE="Santa Catarina"
SSL_LOCALITY="Gaspar"
SSL_ORGANIZATION="School of Net"
SSL_ORGUNIT="TI"
CN="movingcloud.com.br"
#Salvando direotrio atual
PWD=$(pwd);

source $PWD/funcoes/install_basics.sh
source $PWD/funcoes/install_SQLServer.sh
source $PWD/funcoes/install_webserver.sh
source $PWD/funcoes/install_phpmyadmin.sh
source $PWD/funcoes/install_ftp.sh
source $PWD/funcoes/install_quota.sh
source $PWD/funcoes/install_hhvm.sh
source $PWD/funcoes/install_bind.sh
source $PWD/funcoes/install_letsencrypt.sh
source $PWD/funcoes/install_webstats.sh
source $PWD/funcoes/install_jailkit.sh
source $PWD/funcoes/install_failban.sh
source $PWD/funcoes/install_postfix.sh
source $PWD/funcoes/install_mta.sh
source $PWD/funcoes/install_antivirus.sh
source $PWD/funcoes/install_webmail.sh
source $PWD/funcoes/install_ispconfig.sh
echo "Bem vindo a instalação do ISPConfig 3.1"

echo "======================================="
echo "Instalador do ISPConfig"
echo "======================================="

echo "O que você deseja instalar"

echo "1. Servidor de hospedagem de sites"
echo "2.Servidor de e-mails"
echo "3.Servidor com a instalação completa"
read opcao;
if [ "$opcao" == "3" ]; then
echo "Instalando pacotes basicos"
      InstallBasics
echo "Qual banco de dados você quer instalar?"
echo "MySQL ou MariaDB"
read CFG_SQLSERVER;
      InstallSQLServer
echo "Qual servidor web voce quer trabalhar?"
echo "apache ou nginx"
read CFG_WEBSERVER;
      InstallWebServer
echo "Instalando PHPMyadmin"
      InstallPHPMyAdmin
echo "Instalando FTP"
      InstallFTP
echo "Instalando Quota"
      InstallQuota
echo "Instalando Postfix"
      InstallPostfix
echo "Instalando MTA"
      InstallMTA
echo "Instalando utilitarios de Antivirus"
      InstallAntiVirus
echo "Instalando Lets Encrypt"
      InstallLetsEncrypt
echo "Instalando HHVM"
      InstallHHVM
echo "Instalando Bind DNS"
      InstallBind
echo "Instalando WebStats"
      InstallWebStats
echo -n "Instalando Jailkit"
      InstallJailkit
echo -n "Instalando Fail2Ban"
      InstallFail2ban
echo -n "Instalando cliente de e-mail"
      InstallWebmail
echo -n "Instalando ISPConfig"
      InstallISPConfig

fi


