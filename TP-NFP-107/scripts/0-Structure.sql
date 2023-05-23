DROP DATABASE IF EXISTS bdd_pizza;
CREATE DATABASE bdd_pizza;
USE bdd_pizza;

# Localisation

CREATE TABLE zone
(
    id_zone  int(11) PRIMARY KEY AUTO_INCREMENT,
    nom_zone varchar(50)
);

CREATE TABLE quartier
(
    id_quartier  int(11) PRIMARY KEY AUTO_INCREMENT,
    ref_zone     int(11), FOREIGN KEY (ref_zone) REFERENCES zone (id_zone),
    nom_quartier varchar(50)
);

CREATE TABLE adresse
(
    id_adresse   int(11) PRIMARY KEY AUTO_INCREMENT,
    ref_quartier int(11), FOREIGN KEY (ref_quartier) REFERENCES quartier (id_quartier),
    adresse      varchar(50)
);



# Livreur

CREATE TABLE locomotion
(
    id_locomotion    int(11) PRIMARY KEY AUTO_INCREMENT,
    label_locomotion varchar(50)
);

CREATE TABLE status_livreur
(
    id_satus_livreur     int(11) PRIMARY KEY AUTO_INCREMENT,
    label_status_livreur varchar(50)
);

CREATE TABLE livreur
(
    id_livreur         int(11) PRIMARY KEY AUTO_INCREMENT,
    ref_zone           int(11), FOREIGN KEY (ref_zone) REFERENCES zone (id_zone),
    ref_locomotion     int(11), FOREIGN KEY (ref_locomotion) REFERENCES locomotion (id_locomotion),
    ref_status_livreur int(11), FOREIGN KEY (ref_status_livreur) REFERENCES status_livreur (id_satus_livreur),
    nom_livreur        varchar(50),
    prenom_livreur     varchar(50)
);



# Livraison

CREATE TABLE etat_livraison
(
    id_etat_livraison    int(11) PRIMARY KEY AUTO_INCREMENT,
    label_etat_livraison varchar(50)
);

CREATE TABLE livraison
(
    id_livraison            int(11) PRIMARY KEY AUTO_INCREMENT,
    ref_livreur             int(11), FOREIGN KEY (ref_livreur) REFERENCES livreur (id_livreur),
    ref_etat_livraison      int(11), FOREIGN KEY (ref_etat_livraison) REFERENCES etat_livraison (id_etat_livraison),
    heure_reception_livreur timestamp
);



# Client

CREATE TABLE compte_client
(
    id_compte_client     int(11) PRIMARY KEY AUTO_INCREMENT,
    nom_compte_client    varchar(50),
    prenom_compte_client varchar(50),
    tel_compte_client    int(11),
    mail_compte_client   varchar(50),
    mdp_compte_client    varchar(50)
);



# Commande

CREATE TABLE type_commande
(
    id_type_commande    int(11) PRIMARY KEY AUTO_INCREMENT,
    label_type_commande varchar(50)
);

CREATE TABLE etat_commande
(
    id_etat_commande    int(11) PRIMARY KEY AUTO_INCREMENT,
    label_etat_commande varchar(50)
);

CREATE TABLE reduction
(
    id_reduction             int(11) PRIMARY KEY AUTO_INCREMENT,
    code_reduction           varchar(50),
    quantite_reduction       decimal(9, 2),
    date_limite_reduction    timestamp,
    nb_utilisations_reduction int(11)
);

CREATE TABLE commande
(
    id_commande            int(11) PRIMARY KEY AUTO_INCREMENT,
    ref_compte_client      int(11), FOREIGN KEY (ref_compte_client) REFERENCES compte_client (id_compte_client),
    ref_adresse            int(11), FOREIGN KEY (ref_adresse) REFERENCES adresse (id_adresse),
    ref_livraison          int(11), FOREIGN KEY (ref_livraison) REFERENCES livraison (id_livraison),
    ref_reduction          int(11), FOREIGN KEY (ref_reduction) REFERENCES reduction (id_reduction),
    ref_type_commande      int(11), FOREIGN KEY (ref_type_commande) REFERENCES type_commande (id_type_commande),
    ref_etat_commande      int(11), FOREIGN KEY (ref_etat_commande) REFERENCES etat_commande (id_etat_commande),
    heure_commande         timestamp,
    heure_reception_client timestamp
);



# Paiement

CREATE TABLE mode_paiement
(
    id_mode_paiement    int(11) PRIMARY KEY AUTO_INCREMENT,
    label_mode_paiement varchar(50)
);

CREATE TABLE paiement
(
    ref_mode_paiement int(11), FOREIGN KEY (ref_mode_paiement) REFERENCES mode_paiement (id_mode_paiement),
    ref_commande      int(11), FOREIGN KEY (ref_commande) REFERENCES commande (id_commande),
    quantite_paiement decimal(9, 2)
);



# Menu

CREATE TABLE menu
(
    id_menu      int(11) PRIMARY KEY AUTO_INCREMENT,
    ref_commande int(11), FOREIGN KEY (ref_commande) REFERENCES commande (id_commande),
    label_menu   varchar(50)
);

CREATE TABLE type_supplement
(
    id_type_supplement int(11) PRIMARY KEY AUTO_INCREMENT,
    label_supplement   varchar(50)
);

CREATE TABLE supplement
(
    id_supplement       int(11) PRIMARY KEY AUTO_INCREMENT,
    ref_type_supplement int(11), FOREIGN KEY (ref_type_supplement) REFERENCES type_supplement (id_type_supplement),
    label_supplement    varchar(50),
    prix_supplement     decimal(9, 2)
);

CREATE TABLE supplements_menu
(
    ref_menu             int(11), FOREIGN KEY (ref_menu) REFERENCES menu (id_menu),
    ref_supplement       int(11), FOREIGN KEY (ref_supplement) REFERENCES supplement (id_supplement),
    quantite_supplements int(11)
);



# Pizza

CREATE TABLE taille
(
    id_taille     int(11) PRIMARY KEY AUTO_INCREMENT,
    valeur_taille decimal(9, 2),
    label_taille  varchar(50),
    prix_taille   decimal(9, 2)
);

CREATE TABLE sauce
(
    id_sauce    int(11) PRIMARY KEY AUTO_INCREMENT,
    label_sauce varchar(50),
    prix_sauce  decimal(9, 2)
);

CREATE TABLE pate
(
    id_pate    int(11) PRIMARY KEY AUTO_INCREMENT,
    label_pate varchar(50),
    prix_pate  decimal(9, 2)
);

CREATE TABLE ingredient
(
    id_ingredient    int(11) PRIMARY KEY AUTO_INCREMENT,
    label_ingredient varchar(50),
    prix_ingredient  decimal(9, 2)
);

CREATE TABLE pizza
(
    id_pizza   int(11) PRIMARY KEY AUTO_INCREMENT,
    ref_pate   int(11), FOREIGN KEY (ref_pate) REFERENCES pate (id_pate),
    ref_sauce  int(11), FOREIGN KEY (ref_sauce) REFERENCES sauce (id_sauce),
    ref_taille int(11), FOREIGN KEY (ref_taille) REFERENCES taille (id_taille),
    ref_menu   int(11), FOREIGN KEY (ref_menu) REFERENCES menu (id_menu)
);

CREATE TABLE ingredients_pizza
(
    ref_ingredient       int(11), FOREIGN KEY (ref_ingredient) REFERENCES ingredient (id_ingredient),
    ref_pizza            int(11), FOREIGN KEY (ref_pizza) REFERENCES pizza (id_pizza),
    quantite_ingredients int(11)
);