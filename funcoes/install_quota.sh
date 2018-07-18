InstallQuota () {
 echo -n "Instalando Quota"
 apt-get -y install quota quotatool
 echo -n "Editando FSTab"
  sed -i 's/errors=remount-ro.*/errors=remount-ro,usrjquota=quota.user,grpjquota=quota.group,jqfmt=vfsv0 0 1/' /etc/fstab
 mount -o remount /
 quotacheck -avugm
 quotaon -avug
 echo -e "[${green}FEITO!${NC}]\n" 
}
