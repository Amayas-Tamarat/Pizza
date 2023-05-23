USE bdd_pizza;

# Classer les zones par nombre de quartiers
CREATE PROCEDURE `1 - Classement des zones par nombre de quartiers`()
    NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER
SELECT
    zone.nom_zone, COUNT(id_quartier) as nb_quartiers
FROM
    zone, quartier
WHERE
    zone.id_zone = quartier.ref_zone
GROUP BY
    zone.id_zone
ORDER BY
    nb_quartiers DESC
;