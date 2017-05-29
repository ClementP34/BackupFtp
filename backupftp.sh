#!/bin/bash

# Initialisation des constantes
#Information pour le FTP
HOST='Host_du_serveur_FTP'
LOGIN='Login_du_FTP'
PASSWORDFTP='PASSWORD_du_FTP'
#Informations pour le chiffrage
PASSWORDCRYPT='PASSWORD_du_FTP'
#Repertoire à sauvegarder
SAVEDIRECTORY='/home/'

#Emplacement du fichier formaté avec la date et l'heure
NAME='backup-home_'`date +%F-%Hh%M`'.tar.gz'
FULLNAME='/root/backup/'$NAME

#Test si le dossier à sauvegarder existe
if [ -d $SAVEDIRECTORY ];then
#conpression avec tar
tar czf $FULLNAME $SAVEDIRECTORY
#Chiffrage avec openssl en aes 256
openssl enc -e -aes-256-cbc -in $FULLNAME -out $FULLNAME.crypt -pass pass:$PASSWORDCRYPT
#On supprime l'archive en clair pour rien laisser traîner
rm -R $FULLNAME
FULLNAME=$FULLNAME.crypt
NAME=$NAME.crypt
# le transfert FTP
ftp -i -p -n $HOST << END_FTP
quote USER $LOGIN
quote PASS $PASSWORDFTP
bin
put $FULLNAME /backup/$NAME
bye
END_FTP
#Pour finir, on peut liberer l'espace
#rm -R $FULLNAME
else
echo 'Dossier source introuvable ('$SAVEDIRECTORY')'
fi
