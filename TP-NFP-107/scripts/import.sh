#!/bin/bash
MYSQL_USER=root
MYSQL_PASSWORD=root
mysql -u $MYSQL_USER -p$MYSQL_PASSWORD < scripts/0-Structure.sql
mysql -u $MYSQL_USER -p$MYSQL_PASSWORD < scripts/1-Fonctions.sql
mysql -u $MYSQL_USER -p$MYSQL_PASSWORD < scripts/2-Triggers.sql
mysql -u $MYSQL_USER -p$MYSQL_PASSWORD < scripts/3-Procedures.sql
mysql -u $MYSQL_USER -p$MYSQL_PASSWORD < scripts/4-Donnees.sql