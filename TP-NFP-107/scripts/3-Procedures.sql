USE bdd_pizza;

/*
 Procédure de test du TRIGGER 'utilisation_bon_de_reduction' :
    - Création de 3 commandes
    - Modification de ces 3 commandes
    - Affichage du résultat
*/
DELIMITER //
    CREATE PROCEDURE test_utilisation_bon_de_reduction()
        BEGIN
            /* Afichage du nombre d'utilisation des bons */
            SELECT id_reduction, nb_utilisations_reduction FROM reduction;

            /* Création de 3 commandes */
            INSERT INTO
                commande(ref_reduction)
            VALUES
                (1),
                (3),
                (5);

            /* Attribution de l'état 2 (confimée) à ces 3 commandes */
            UPDATE commande
            SET ref_etat_commande = 2
            ORDER BY id_commande DESC LIMIT 3;

            /* Vérification de la baisse du nombre d'utilisation des bons */
            SELECT id_reduction, nb_utilisations_reduction FROM reduction;
        END;
    ;
//



/*
 Procédure de test du TRIGGER 'utilisation_bon_de_reduction' :
    - Création de 3 commandes
    - Modification de ces 3 commandes
    - Affichage du résultat
*/
DELIMITER //
    CREATE PROCEDURE test_verification_paiement()
    BEGIN
        DECLARE id_commande INT(11);
        DECLARE id_menu INT(11);
        DECLARE id_pizza INT(11);

        /* Création de 3 commandes */
        INSERT INTO commande() VALUES ();
        SET id_commande = LAST_INSERT_ID();
    /* 9 + 1 + 1.5 */
        INSERT INTO menu(ref_commande) VALUES (id_commande);
        SET id_menu = LAST_INSERT_ID();
        INSERT INTO supplements_menu (ref_menu, ref_supplement, quantite_supplements) VALUES (id_menu,1,1);
        INSERT INTO supplements_menu (ref_menu, ref_supplement, quantite_supplements) VALUES (id_menu,6,1);
    /* 05+05+6 + 1+1 = 9 */
        INSERT INTO pizza(ref_pate, ref_sauce, ref_taille, ref_menu) VALUES (2,2,2,id_menu);
        SET id_pizza = LAST_INSERT_ID();
        INSERT INTO ingredients_pizza(ref_ingredient, ref_pizza, quantite_ingredients) VALUES (2,id_pizza,1);
        INSERT INTO ingredients_pizza(ref_ingredient, ref_pizza, quantite_ingredients) VALUES (5,id_pizza,1);

        SELECT calcPrixCommande(id_commande);
    END;
;
//



/*
 Procédure de test du TRIGGER 'attribution_livraison_commande' :
    - Création de 15 commandes
    - Modification de ces 15 commandes
    - Affichage du résultat
*/
DELIMITER //
    CREATE PROCEDURE test_attribution_livraison_commande()
        BEGIN
            # Création de 15 commandes
            INSERT INTO
                commande(ref_adresse, ref_type_commande)
            VALUES
                (1 , 3),
                (5 , 3), (8 , 3),
                (9 , 3), (11, 3), (12, 3),
                (13, 3), (14, 3), (15, 3), (16, 3),
                (17, 3), (18, 3), (19, 3), (20, 3), (20, 3);

            /* Attribution de l'état 5 (prêt) à ces 15 commandes */
            UPDATE commande
            SET ref_etat_commande = 5
            ORDER BY id_commande DESC LIMIT 15;

            /* Vérification de l'attribution des livraisons des commandes */
            SELECT
                id_commande   as commande,
                nom_zone      as zone,
                ref_livraison as livraison
            FROM commande
                     LEFT JOIN adresse  on adresse.id_adresse   = commande.ref_adresse
                     LEFT JOIN quartier on adresse.ref_quartier = quartier.id_quartier
                     LEFT JOIN zone     on quartier.ref_zone    = zone.id_zone
            ORDER BY id_commande DESC
            LIMIT 15;
        END;
    ;
//