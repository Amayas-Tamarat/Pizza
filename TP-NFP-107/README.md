# TP-NFP-107

## <u> Liens </u>

- [Schéma BDD Diagram](https://dbdiagram.io/d/63491873f0018a1c5f028592)
- [GitHub](https://github.com/Leon-guerineau/TP-NFP-107)

## <u> Commandes Utiles </u>

- ### Lancer les containers
```Shell
docker-compose up -d
```
- ### Fermer les containers
```Shell
docker-compose down
```
- ### Recréer la base avec toutes les données
```Shell
docker exec tp-nfp-107_mysql /bin/bash scripts/import.sh
```
- ### Aller dans le shell du container mysql (pas vraiment utile)
```Shell
docker exec -it tp-nfp-107_mysql bash
```