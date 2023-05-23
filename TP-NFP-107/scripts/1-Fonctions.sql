USE bdd_pizza;

/*
 Calcule le prix d'une pizza
 Utilisations dans l'application :
    - afficher le détail du prix de la commande
 Utilisation en base :
    - calculer le prix de la commande
*/
CREATE FUNCTION calcPrixPizza(id_pizza_cible INT)
    RETURNS DECIMAL(9,2)
    READS SQL DATA
    RETURN(
        SELECT
            taille.prix_taille
              + pate.prix_pate
              + sauce.prix_sauce
              + SUM(ingredient.prix_ingredient * ingredients_pizza.quantite_ingredients)
        FROM pizza
          LEFT JOIN taille ON pizza.ref_taille = taille.id_taille
          LEFT JOIN pate ON pizza.ref_pate = pate.id_pate
          LEFT JOIN sauce ON pizza.ref_sauce = sauce.id_sauce
          LEFT JOIN ingredients_pizza ON pizza.id_pizza = ingredients_pizza.ref_pizza
          LEFT JOIN ingredient ON ingredients_pizza.ref_ingredient = ingredient.id_ingredient
        WHERE pizza.id_pizza = id_pizza_cible
        GROUP BY pizza.id_pizza
    )
;

/*
 Calcule le prix total des suppléments d'un menu
 Utilisations dans l'application :
    - afficher le détail du prix de la commande
 Utilisation en base :
    - calculer le prix de la commande
*/
CREATE FUNCTION calcTotalSupplementsMenu(id_menu_cible INT)
    RETURNS DECIMAL(9,2)
    READS SQL DATA
    RETURN(
        /* La fonction IFNULL empêche d'avoir la valeur NULL dans les calculs */
        SELECT IFNULL(SUM(supplement.prix_supplement * supplements_menu.quantite_supplements), 0)
        FROM menu
          LEFT JOIN supplements_menu ON menu.id_menu = supplements_menu.ref_menu
          LEFT JOIN supplement ON supplements_menu.ref_supplement = supplement.id_supplement
        WHERE menu.id_menu = id_menu_cible
    )
;

/*
 Calcule le prix d'un menu
 Utilisations dans l'application :
    - afficher le détail du prix de la commande
 Utilisation en base :
    - calculer le prix de la commande
*/
CREATE FUNCTION calcPrixMenu(id_menu_cible INT)
    RETURNS DECIMAL(9,2)
    READS SQL DATA
    RETURN(
        SELECT
            /* La fonction IFNULL empêche d'avoir la valeur NULL dans les calculs */
            IFNULL(SUM(calcPrixPizza(pizza.id_pizza)), 0)
              + calcTotalSupplementsMenu(id_menu_cible)
        FROM menu LEFT JOIN pizza ON menu.id_menu = pizza.ref_menu
        WHERE menu.id_menu = id_menu_cible
    )
;

/*
 Calcule le prix d'une commande
 Utilisations dans l'application :
    - afficher le prix de la commande
    - donner la valeur du montant à pailler paiement
*/
CREATE FUNCTION calcPrixCommande(id_commande_cible INT)
    RETURNS DECIMAL(9,2)
    READS SQL DATA
    RETURN(
        SELECT
            /* La fonction GREATEST empêche d'avoir un prix négatif avec la réduction */
            GREATEST(
                SUM(calcPrixMenu(menu.id_menu))
                  - IFNULL(SUM(reduction.quantite_reduction),0),
                0
            )
        FROM commande
          LEFT JOIN reduction ON commande.ref_reduction = reduction.id_reduction
          LEFT JOIN menu ON commande.id_commande = menu.ref_commande
        WHERE commande.id_commande = id_commande_cible
        GROUP BY menu.ref_commande
    )
;

/*
 Calcule le prix d'une commande
 Utilisations dans l'application :
    - afficher le prix de la commande
    - donner la valeur du montant à pailler paiement
*/
CREATE FUNCTION calcPaiementsCommande(id_commande_cible INT)
    RETURNS DECIMAL(9,2)
    READS SQL DATA
    RETURN(
        SELECT SUM(paiement.quantite_paiement)
        FROM paiement
        WHERE paiement.ref_commande = id_commande_cible
        GROUP BY paiement.ref_commande
    )
;

/*
 Cherche une livraison en état 1 (en attente) avec moins de 3 commandes allant vers la zone ciblée
 Utilisation en base :
    - trouver une livraison valide pour la commande
*/
CREATE FUNCTION chercherLivraisonsParZone(id_zone_cible INT)
    RETURNS INT(11)
    READS SQL DATA
    RETURN(
        SELECT MIN(livraison.id_livraison)
        FROM livraison
          LEFT JOIN commande ON livraison.id_livraison = commande.ref_livraison
          LEFT JOIN adresse ON commande.ref_adresse = adresse.id_adresse
          LEFT JOIN quartier ON adresse.ref_quartier = quartier.id_quartier
          LEFT JOIN zone ON quartier.ref_zone = zone.id_zone
        WHERE zone.id_zone = id_zone_cible
          AND livraison.ref_etat_livraison = 1
        GROUP BY livraison.id_livraison
        HAVING COUNT(commande.id_commande) < 3
    )
;