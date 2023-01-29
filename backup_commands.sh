zip -q -P 6847FuckAbiding6847 -r interface_backup.zip /home/abidingg/public_html/atil/
mysqldump abidingg_ods -uabidingg_root -p__mMnNbB12_x > /home/abidingg/db_backup.sql
zip -q -P 6847FuckAbiding6847  /home/abidingg/db_backup.zip db_backup.sql
mutt -s "ATIL OMIS DATABASE" -a /home/abidingg/db_backup.zip /home/abidingg/interface_backup.zip -- ashraful.cse07@yahoo.com < /home/abidingg/body.txt
rm -f /home/abidingg/db_backup.zip /home/abidingg/db_backup.sql /home/abidingg/interface_backup.zip