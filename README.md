# BackupFtp
Script bash pour sauvegarder sur un serveur ftp une archive chiffrée.

Necessiste openssl et tar

--------------------------------------------

Pour déchiffrer l'archive :

openssl enc -d -aes-256-cbc -in fichier-chiffré.crypt -out fichier-déchiffré.tar.gz

--------------------------------------------

Pour decompresser l'archive :

tar xvzf archive.tar.gz 

--------------------------------------------

Tache cron tout les jours, dans /etc/crontab :

echo '0 4  * *  * root /chemin/de/backupftp.sh'
