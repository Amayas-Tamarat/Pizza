USE bdd_pizza;

/*
 Se produit à chaque modifications d'une commande :
    - Réduit le nombre d'utilisations restantes du bon de réduction lié si la commande est à l'état 2 (confimée)
 */
CREATE TRIGGER utilisation_bon_de_reduction
    AFTER UPDATE ON commande
    FOR EACH ROW UPDATE reduction
        SET nb_utilisations_reduction = nb_utilisations_reduction - 1
        WHERE id_reduction = NEW.ref_reduction
        AND NEW.ref_etat_commande = 2
;

/*
 Se produit à chaque enregistrement d'un paiement :
    - Attribue l'état 3 (payée) à la la commande payée si la somme de ces paiements est supérieur ou égales à son prix
*/
CREATE TRIGGER verification_paiement
    AFTER INSERT ON paiement
    FOR EACH ROW UPDATE commande
        SET commande.ref_etat_commande = 3
        WHERE id_commande = NEW.ref_commande
        AND calcPaiementsCommande(NEW.ref_commande) >= calcPrixCommande(NEW.ref_commande)
;

/*
 Se produit avant chaque modifications d'une commande :
  Si la commande est de type 3 (livraison), à l'état 5 (prêt) et n'est pas attribuée à une livraison :
    - lui attribue une livraison ayant des commandes dans la même zone ou en crée une
*/
/* DELIMITER // permet de dire au CREATE TRIGGER qu'il se fini au prochain '//' au lieu du premier ';' ligne 40 */
DELIMITER //
    CREATE TRIGGER attribution_livraison_commande
        BEFORE UPDATE ON commande
        FOR EACH ROW
        IF(NEW.ref_etat_commande = 5 AND NEW.ref_type_commande = 3 AND NEW.ref_livraison IS NULL) THEN
            BEGIN
                /* On cherche la zone du quartier de l'adresse de la commande */
                DECLARE test INT(11);
                SET test = (
                    SELECT zone.id_zone
                    FROM commande
                      LEFT JOIN adresse ON commande.ref_adresse = adresse.id_adresse
                      LEFT JOIN quartier ON adresse.ref_quartier = quartier.id_quartier
                      LEFT JOIN zone ON quartier.ref_zone = zone.id_zone
                    WHERE commande.id_commande = NEW.id_commande
                );
                /* S'il y a une livraison valide, y attribuer la commande sinon créer une nouvelle livraison */
                IF chercherLivraisonsParZone(test) IS NOT NULL THEN
                    SET NEW.ref_livraison = chercherLivraisonsParZone(test);
                ELSE
                    INSERT livraison(ref_etat_livraison) VALUES ('1');
                    SET NEW.ref_livraison = LAST_INSERT_ID();
                END IF;
            END;
        END IF;
    ;
//

