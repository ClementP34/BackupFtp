# BackupFtp
Script bash pour sauvegarder sur un serveur ftp une archive chiffrée.

Necessiste openssl et tar

Pour déchiffrer l'archive :
openssl enc -d -aes-256-cbc -in fichier-chiffré.crypt -out fichier-déchiffré.tar.gz
Ensuite, il faut rentré le code de déchiffrage

Pour decopresser l'archive
tar xvzf archive.tar.gz 
