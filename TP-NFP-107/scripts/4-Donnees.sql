USE bdd_pizza;

# Localisation

INSERT INTO
    zone (id_zone, nom_zone)
VALUES
    ('1', 'Nord-Ouest'),
    ('2', 'Nord-Est'  ),
    ('3', 'Centre'    ),
    ('4', 'Sud-Est'   ),
    ('5', 'Sud-Ouest' )
;

INSERT INTO
    quartier (id_quartier, ref_zone, nom_quartier)
VALUES
    # Zone 1
    ('1' , '1', 'Carnot'           ),
    ('2' , '1', 'Foch'             ),
    ('3' , '1', 'Montaud'          ),
    ('4' , '1', 'Côte-Chaude'      ),
    ('5' , '1', 'Michon'           ),
    ('6' , '1', 'Grand Clos'       ),
    ('7' , '1', 'La Terrasse'      ),
    ('8' , '1', 'Bergson'          ),
    ('9' , '1', 'Bel Air'          ),
    ('10', '1', 'Momey'            ),
    ('11', '1', 'Le Golf'          ),
    # Zone 2
    ('12', '2', 'Le Soleil'        ),
    ('13', '2', 'Méons'            ),
    ('14', '2', 'Grangeneuve'      ),
    ('15', '2', 'Le Marais'        ),
    ('16', '2', 'Le Bardot'        ),
    ('17', '2', 'Monthieu'         ),
    ('18', '2', 'Saint-François'   ),
    ('19', '2', 'Le Treyve'        ),
    ('20', '2', 'Puits Thibaud'    ),
    # Zone 3
    ('21', '3', 'Jacquard'         ),
    ('22', '3', 'Préfecture'       ),
    ('23', '3', 'Centre-Ville'     ),
    ('24', '3', 'Chavanelle'       ),
    ('25', '3', 'Crêt de Roch'     ),
    ('26', '3', 'Fourneyron'       ),
    ('27', '3', 'Châteaucreux'     ),
    # Zone 4
    ('28', '4', 'Badouillère'      ),
    ('29', '4', 'Colline des Pères'),
    ('30', '4', 'Tardy'            ),
    ('31', '4', 'Centre Deux'      ),
    ('32', '4', 'Bizillon'         ),
    ('33', '4', 'Saint-Roch'       ),
    ('34', '4', 'Valbenoîte'       ),
    ('35', '4', 'Couriot'          ),
    ('36', '4', 'Tarentaize'       ),
    ('37', '4', 'Beaubrun'         ),
    ('38', '4', 'La Cotonne'       ),
    ('39', '4', 'Montferré'        ),
    ('40', '4', 'Béraudière'       ),
    ('41', '4', 'Montmartre'       ),
    ('42', '4', 'Le Devey'         ),
    ('43', '4', 'Malacussy'        ),
    # Zone 5
    ('44', '5', 'Villeboeuf'       ),
    ('45', '5', 'La Dame Blanche'  ),
    ('46', '5', 'Vivaraize'        ),
    ('47', '5', 'Fauriel'          ),
    ('48', '5', 'Beaulieu'         ),
    ('49', '5', 'Montchovet'       ),
    ('50', '5', 'La Marandinière'  ),
    ('51', '5', 'Montplaisir'      ),
    ('52', '5', 'La Richelandière' )
;

INSERT INTO
    adresse (id_adresse, ref_quartier, adresse)
VALUES
    # Zone 1
    ('1' , '1' , '75 Rue Marengo'          ),
    ('2' , '6' , '14 Rue Charles Perrault' ),
    ('3' , '4' , '22 Rue Penel'            ),
    ('4' , '9' , '5 Rue Caussidière'       ),
    # Zone 2
    ('5' , '15', '15 Rue des Aciéries'     ),
    ('6' , '18', '35 Rue des Alliés'       ),
    ('7' , '14', '21 Rue Jean Huss'        ),
    ('8' , '12', '16 Rue Louis Soulié'     ),
    # Zone 3
    ('9' , '22', '11 Rue Dormoy'           ),
    ('10', '25', '7 Imp. Desjoyaux'        ),
    ('11', '24', '3 Rue Mulatière'         ),
    ('12', '25', '36 Rue Paul Appel'       ),
    # Zone 4
    ('13', '36', '25 Rue Tarentaize'       ),
    ('14', '35', '14 Rue du Puits Châtelus'),
    ('15', '37', '30 Rue Beaubrun'         ),
    ('16', '43', '11 Rue du Puits Pinel'   ),
    # Zone 5
    ('17', '47', '7 Rue Desflaches'        ),
    ('18', '52', '59 Rue de Terrenoire'    ),
    ('19', '48', '5 Rue Jan Palach'        ),
    ('20', '49', '14 Rue Baudin'           )
;



# Livreur

INSERT INTO
    locomotion (id_locomotion, label_locomotion)
VALUES
    ('1', 'pieds'      ),
    ('2', 'trottinette'),
    ('3', 'vélo'       ),
    ('4', 'moto'       ),
    ('5', 'voiture'    )
;

INSERT INTO
    status_livreur (id_satus_livreur, label_status_livreur)
VALUES
    ('1', 'absent'      ),
    ('2', 'en attente'  ),
    ('3', 'en livraison'),
    ('4', 'en retour'   )
;

INSERT INTO
    livreur (id_livreur, ref_zone, ref_locomotion, ref_status_livreur, nom_livreur, prenom_livreur)
VALUES
    # Zone 1
    ('1' , '1', '4', '2', 'Roch'     , 'Busson'      ),
    ('2' , '1', '4', '2', 'France'   , 'Lazure'      ),
    ('3' , '1', '5', '2', 'Faye'     , 'Grignon'     ),
    # Zone 2
    ('4' , '2', '4', '2', 'Laurette' , 'Adler'       ),
    ('5' , '2', '4', '2', 'Slainie'  , 'Pitre'       ),
    ('6' , '2', '5', '2', 'Simone'   , 'Galarneau'   ),
    # Zone 3
    ('7' , '3', '1', '2', 'Francis'  , 'Cormier'     ),
    ('8' , '3', '2', '2', 'Stéphane' , 'Masson'      ),
    ('9' , '3', '3', '2', 'Raymond'  , 'Goudreau'    ),
    # Zone 4
    ('10', '4', '4', '2', 'Inès'     , 'Sylvain'     ),
    ('11', '4', '4', '2', 'Maurelle' , 'Lacharité'   ),
    ('12', '4', '5', '2', 'Charles'  , 'Vertefeuille'),
    # Zone 5
    ('13', '5', '4', '2', 'Claire'   , 'Sylvain'     ),
    ('14', '5', '4', '2', 'Pansy'    , 'Moreau'      ),
    ('15', '5', '5', '2', 'Agathe'   , 'Lapierre'    )
;



# Livraison

INSERT INTO
    etat_livraison(id_etat_livraison, label_etat_livraison)
VALUES
    ('1', 'en attente'  ),
    ('2', 'en livraison'),
    ('3', 'fini'        )
;

INSERT INTO
    livraison (id_livraison, ref_livreur, ref_etat_livraison, heure_reception_livreur)
VALUES
    ('1', '3' , '3', '2022-11-11 15:29:32'),
    ('2', '5' , '3', '2022-11-11 20:27:26'),
    ('3', '7' , '3', '2022-11-11 12:01:50'),
    ('4', '11', '3', '2022-11-11 12:34:14'),
    ('5', '13', '3', '2022-11-11 21:49:16')
;



# Client

INSERT INTO
    compte_client (id_compte_client, nom_compte_client, prenom_compte_client, tel_compte_client, mail_compte_client, mdp_compte_client)
VALUES
    ('1' , 'Vick'      , 'Barrette', '0193066520', 'VickBarrette@rhyta.com'           , 'j4s7nUQY'),
    ('2' , 'Jérôme'    , 'Dostie'  , '0388500062', 'JeromeDostie@rhyta.com'           , 'fCyOQ12a'),
    ('3' , 'Arnaude'   , 'Dodier'  , '0329104575', 'ArnaudeDodier@armyspy.com'        , 'rhceiHH9'),
    ('4' , 'Marjolaine', 'Leblanc' , '0177920496', 'MarjolaineLeblanc@rhyta.com'      , 'Nesxllyw'),
    ('5' , 'Anne'      , 'Bouvier' , '0594667829', 'AnneBouvier@rhyta.com'            , 'gU6kCiXW'),
    ('6' , 'Landers'   , 'Marceau' , '0454308050', 'LandersMarceau@teleworm.us'       , 'JbwMkld5'),
    ('7' , 'Noémi'     , 'Leroy'   , '0319200769', 'NoemiLeroy@jourrapide.com'        , 'm53O7QEy'),
    ('8' , 'Alphonsine', 'Lemaître', '0143117001', 'AlphonsineLemaitre@teleworm.us'   , 'w4Oy8zda'),
    ('9' , 'Archaimbau', 'Larocque', '0421615553', 'ArchaimbauLarocque@jourrapide.com', 'VkmEca3b'),
    ('10', 'Channing'  , 'Margand' , '0512260686', 'ChanningMargand@dayrep.com'       , 'dGHK2l6p'),
    ('11', 'Norris'    , 'Corbin'  , '0426896714', 'NorrisCorbin@armyspy.com'         , 'u5z1xmzB'),
    ('12', 'Karlotta'  , 'Adler'   , '0342827270', 'KarlottaAdler@rhyta.com'          , 'UPjL7JtW'),
    ('13', 'Brice'     , 'Voisine' , '0499153634', 'BriceVoisine@armyspy.com'         , 'bUX4vDL3'),
    ('14', 'Pierpont'  , 'Doucet'  , '0529965894', 'PierpontDoucet@dayrep.com'        , 'ps0xa4KX'),
    ('15', 'Aymon'     , 'Sauvé'   , '0523155141', 'AymonSauve@jourrapide.com'        , 'slixuxVA')
;



# Commande

INSERT INTO type_commande
(id_type_commande, label_type_commande)
VALUES
    ('1', 'sur place' ),
    ('2', 'à emporter'),
    ('3', 'livraison' )
;

INSERT INTO etat_commande
(id_etat_commande, label_etat_commande)
VALUES
    ('1', 'en attente'    ),
    ('2', 'confimée'      ),
    ('3', 'payée'         ),
    ('4', 'en préparation'),
    ('5', 'prêt'          ),
    ('6', 'en livraison'  ),
    ('7', 'récupérée'     ),
    ('8', 'annulée'       )
;

INSERT INTO
    reduction (id_reduction, code_reduction, quantite_reduction, date_limite_reduction, nb_utilisations_reduction)
VALUES
    ('1', 'CODEREDUC1', '1', '2023-01-31 00:00:00', '5'),
    ('2', 'CODEREDUC2', '2', '2023-06-27 00:00:00', '4'),
    ('3', 'CODEREDUC3', '3', '2023-07-11 00:00:00', '3'),
    ('4', 'CODEREDUC4', '4', '2023-10-18 00:00:00', '2'),
    ('5', 'CODEREDUC5', '5', '2023-12-18 00:00:00', '1')
;

INSERT INTO
    commande (id_commande, ref_compte_client, ref_adresse, ref_livraison, ref_reduction, ref_type_commande, ref_etat_commande, heure_commande, heure_reception_client)
VALUES
    ('1' , '1' , NULL, NULL, NULL, '1', '7', '2022-11-11 14:28:59', '2022-11-11 14:34:41'),
    ('2' , '2' , '3' , '1' , NULL, '3', '7', '2022-11-11 15:25:52', '2022-11-11 15:56:44'),
    ('3' , '3' , NULL, NULL, '4' , '2', '7', '2022-11-11 21:46:28', '2022-11-11 22:12:43'),
    ('4' , '4' , '5' , '2' , NULL, '3', '7', '2022-11-11 20:20:42', '2022-11-11 20:50:25'),
    ('5' , '5' , '7' , '2' , NULL, '3', '7', '2022-11-11 20:18:31', '2022-11-11 20:39:01'),
    ('6' , '6' , NULL, NULL, NULL, '2', '7', '2022-11-11 17:43:34', '2022-11-11 17:47:14'),
    ('7' , '7' , '11', '3' , '1' , '3', '7', '2022-11-11 11:57:29', '2022-11-11 12:23:21'),
    ('8' , '8' , '9' , '3' , NULL, '3', '7', '2022-11-11 12:00:32', '2022-11-11 12:03:14'),
    ('9' , '9' , NULL, NULL, NULL, '1', '7', '2022-11-11 13:01:23', '2022-11-11 13:28:36'),
    ('10', '10', '13', '4' , '2' , '3', '7', '2022-11-11 12:30:52', '2022-11-11 12:39:42'),
    ('11', '11', '16', '4' , NULL, '3', '7', '2022-11-11 12:32:29', '2022-11-11 12:39:30'),
    ('12', '12', NULL, NULL, NULL, '1', '7', '2022-11-11 18:56:00', '2022-11-11 19:15:15'),
    ('13', '13', NULL, NULL, NULL, '1', '7', '2022-11-11 19:21:43', '2022-11-11 19:22:17'),
    ('14', '14', '19', '5' , '5' , '3', '7', '2022-11-11 21:44:33', '2022-11-11 21:52:55'),
    ('15', '15', NULL, NULL, NULL, '2', '7', '2022-11-11 21:42:07', '2022-11-11 21:48:27'),
    ('16', '3' , NULL, NULL, NULL, '2', '7', '2022-11-11 17:25:34', '2022-11-11 17:47:45'),
    ('17', '9' , NULL, NULL, NULL, '1', '7', '2022-11-11 11:50:50', '2022-11-11 12:12:18'),
    ('18', '6' , NULL, NULL, NULL, '2', '7', '2022-11-11 12:48:23', '2022-11-11 13:02:36'),
    ('19', '4' , NULL, NULL, NULL, '1', '7', '2022-11-11 21:12:22', '2022-11-11 21:37:11'),
    ('20', '9' , NULL, NULL, '3' , '2', '7', '2022-11-11 22:42:35', '2022-11-11 23:06:52'),
    ('21', NULL, NULL, NULL, NULL, '1', '7', '2022-11-11 15:14:15', '2022-11-11 15:39:15'),
    ('22', NULL, NULL, NULL, NULL, '1', '7', '2022-11-11 15:16:28', '2022-11-11 15:40:14'),
    ('23', NULL, NULL, NULL, NULL, '2', '7', '2022-11-11 13:38:00', '2022-11-11 13:55:46'),
    ('24', NULL, NULL, NULL, NULL, '1', '7', '2022-11-11 20:06:41', '2022-11-11 20:07:13'),
    ('25', NULL, NULL, NULL, '1' , '2', '7', '2022-11-11 23:07:04', '2022-11-11 23:29:56'),
    ('26', NULL, NULL, NULL, NULL, '2', '7', '2022-11-11 22:08:50', '2022-11-11 22:14:47'),
    ('27', NULL, NULL, NULL, NULL, '2', '7', '2022-11-11 15:46:12', '2022-11-11 16:03:08'),
    ('28', NULL, NULL, NULL, NULL, '1', '7', '2022-11-11 12:04:59', '2022-11-11 12:26:44'),
    ('29', NULL, NULL, NULL, '2' , '1', '7', '2022-11-11 20:07:02', '2022-11-11 20:08:27'),
    ('30', NULL, NULL, NULL, NULL, '1', '7', '2022-11-11 19:37:12', '2022-11-11 19:49:46'),
    ('31', NULL, NULL, NULL, NULL, '2', '7', '2022-11-11 13:19:39', '2022-11-11 13:38:28'),
    ('32', NULL, NULL, NULL, NULL, '1', '7', '2022-11-11 19:45:14', '2022-11-11 20:05:17'),
    ('33', NULL, NULL, NULL, '3' , '1', '7', '2022-11-11 19:14:23', '2022-11-11 19:28:35'),
    ('34', NULL, NULL, NULL, NULL, '2', '7', '2022-11-11 12:45:07', '2022-11-11 13:00:48'),
    ('35', NULL, NULL, NULL, NULL, '2', '7', '2022-11-11 21:05:37', '2022-11-11 21:05:55'),
    ('36', NULL, NULL, NULL, '1' , '1', '7', '2022-11-11 11:09:33', '2022-11-11 11:36:10'),
    ('37', NULL, NULL, NULL, NULL, '1', '7', '2022-11-11 16:39:02', '2022-11-11 16:57:45'),
    ('38', NULL, NULL, NULL, NULL, '1', '7', '2022-11-11 23:32:46', '2022-11-11 23:38:23'),
    ('39', NULL, NULL, NULL, NULL, '2', '7', '2022-11-11 20:20:03', '2022-11-11 20:49:25'),
    ('40', NULL, NULL, NULL, NULL, '2', '7', '2022-11-11 22:36:57', '2022-11-11 22:44:44')
;


# Paiements

INSERT INTO
    mode_paiement (id_mode_paiement, label_mode_paiement)
VALUES
    ('1', 'espèce'        ),
    ('2', 'carte bancaire'),
    ('3', 'chèque'        ),
    ('4', 'points'        )
;

INSERT INTO
    paiement (ref_mode_paiement, ref_commande, quantite_paiement)
VALUES
    ('2', '1' , '12'),
    ('2', '2' , '5' ),
    ('2', '3' , '6' ),
    ('1', '4' , '6' ),
    ('1', '5' , '13'),
    ('2', '6' , '11'),
    ('3', '7' , '8' ),
    ('3', '8' , '7' ),
    ('1', '9' , '10'),
    ('1', '10', '6' ),
    ('3', '11', '9' ),
    ('3', '12', '12'),
    ('2', '13', '14'),
    ('1', '14', '8' ),
    ('3', '15', '6' ),
    ('1', '16', '13'),
    ('2', '17', '15'),
    ('2', '18', '5' ),
    ('2', '19', '5' ),
    ('3', '20', '7' ),
    ('1', '21', '11'),
    ('3', '22', '10'),
    ('2', '23', '7' ),
    ('1', '24', '8' ),
    ('3', '25', '11'),
    ('3', '26', '14'),
    ('3', '27', '13'),
    ('2', '28', '13'),
    ('3', '29', '14'),
    ('3', '30', '15'),
    ('2', '31', '8' ),
    ('2', '32', '15'),
    ('3', '33', '6' ),
    ('3', '34', '15'),
    ('3', '35', '15'),
    ('3', '36', '5' ),
    ('2', '37', '14'),
    ('2', '38', '5' ),
    ('1', '39', '10'),
    ('3', '40', '5' ),
    ('2', '4' , '13'),
    ('2', '6' , '9' ),
    ('1', '23', '9' ),
    ('3', '6' , '10'),
    ('1', '38', '10')
;



# Menu

INSERT INTO
    menu (id_menu, ref_commande, label_menu)
VALUES
    ('1' , '1' , 'menu 1'),
    ('2' , '2' , 'menu 1'),
    ('3' , '3' , 'menu 1'),
    ('4' , '4' , 'menu 1'),
    ('5' , '5' , 'menu 1'),
    ('6' , '6' , 'menu 1'),
    ('7' , '7' , 'menu 1'),
    ('8' , '8' , 'menu 1'),
    ('9' , '9' , 'menu 1'),
    ('10', '10', 'menu 1'),
    ('11', '11', 'menu 1'),
    ('12', '12', 'menu 1'),
    ('13', '13', 'menu 1'),
    ('14', '14', 'menu 1'),
    ('15', '15', 'menu 1'),
    ('16', '16', 'menu 1'),
    ('17', '17', 'menu 1'),
    ('18', '18', 'menu 1'),
    ('19', '19', 'menu 1'),
    ('20', '20', 'menu 1'),
    ('21', '21', 'menu 1'),
    ('22', '22', 'menu 1'),
    ('23', '23', 'menu 1'),
    ('24', '24', 'menu 1'),
    ('25', '25', 'menu 1'),
    ('26', '26', 'menu 1'),
    ('27', '27', 'menu 1'),
    ('28', '28', 'menu 1'),
    ('29', '29', 'menu 1'),
    ('30', '30', 'menu 1'),
    ('31', '31', 'menu 1'),
    ('32', '32', 'menu 1'),
    ('33', '33', 'menu 1'),
    ('34', '34', 'menu 1'),
    ('35', '35', 'menu 1'),
    ('36', '36', 'menu 1'),
    ('37', '37', 'menu 1'),
    ('38', '38', 'menu 1'),
    ('39', '39', 'menu 1'),
    ('40', '40', 'menu 1'),
    ('41', '35', 'menu 2'),
    ('42', '25', 'menu 2'),
    ('43', '30', 'menu 2'),
    ('44', '20', 'menu 2'),
    ('45', '30', 'menu 3')
;



# Supplements

INSERT INTO
    type_supplement (id_type_supplement, label_supplement)
VALUES
    ('1', 'entrés'  ),
    ('2', 'boissons'),
    ('3', 'dessert' )
;

INSERT INTO
    supplement (id_supplement, ref_type_supplement, label_supplement, prix_supplement)
VALUES
    # Entrées
    ('1', '1', 'frites'   , '1'  ),
    ('2', '1', 'fromages' , '1.5'),
    ('3', '1', 'nugets'   , '2'  ),
    # Boissons
    ('4', '2', 'coca'     , '1.5'),
    ('5', '2', 'orangina' , '1.5'),
    ('6', '2', 'oasis'    , '1.5'),
    # Desserts
    ('7', '3', 'donut'    , '0.5'),
    ('8', '3', 'glace'    , '1.5'),
    ('9', '3', 'tiramisu' , '2.5')
;

INSERT INTO
    supplements_menu (ref_menu, ref_supplement, quantite_supplements)
VALUES
    # Entrées
    ('1' , '1', '1'),
    ('2' , '3', '1'),
    ('3' , '2', '1'),
    ('4' , '2', '1'),
    ('5' , '2', '2'),
    ('6' , '2', '2'),
    ('7' , '1', '2'),
    ('8' , '2', '2'),
    ('9' , '2', '1'),
    ('10', '1', '1'),
    ('11', '2', '2'),
    ('12', '3', '2'),
    ('13', '1', '2'),
    ('14', '3', '1'),
    ('15', '1', '2'),
    ('16', '1', '1'),
    ('17', '3', '2'),
    ('18', '3', '2'),
    ('19', '2', '1'),
    ('20', '3', '1'),
    ('21', '1', '1'),
    ('22', '3', '2'),
    ('23', '2', '2'),
    ('24', '1', '1'),
    ('25', '2', '1'),
    ('26', '1', '2'),
    ('27', '2', '1'),
    ('28', '3', '2'),
    ('29', '2', '2'),
    ('30', '3', '2'),
    # Boissons
    ('1' , '6', '1'),
    ('2' , '6', '1'),
    ('3' , '5', '1'),
    ('4' , '4', '2'),
    ('5' , '6', '2'),
    ('6' , '4', '2'),
    ('7' , '6', '1'),
    ('8' , '6', '2'),
    ('9' , '5', '2'),
    ('10', '6', '2'),
    ('11', '6', '2'),
    ('12', '6', '1'),
    ('13', '5', '2'),
    ('14', '6', '1'),
    ('15', '6', '1'),
    ('16', '6', '1'),
    ('17', '5', '2'),
    ('18', '4', '1'),
    ('19', '6', '2'),
    ('20', '6', '2'),
    ('21', '5', '2'),
    ('22', '4', '1'),
    ('23', '5', '2'),
    ('24', '4', '1'),
    ('25', '5', '1'),
    ('26', '4', '1'),
    ('27', '4', '1'),
    ('28', '6', '1'),
    ('29', '6', '1'),
    ('30', '6', '2'),
    ('31', '4', '2'),
    ('32', '4', '1'),
    ('33', '6', '1'),
    ('34', '5', '2'),
    ('35', '5', '2'),
    ('36', '6', '2'),
    ('37', '5', '1'),
    ('38', '4', '1'),
    ('39', '6', '1'),
    ('40', '6', '1'),
    # Desserts
    ('25', '8', '2'),
    ('26', '8', '1'),
    ('27', '7', '2'),
    ('28', '7', '2'),
    ('29', '9', '1'),
    ('30', '8', '1'),
    ('31', '7', '1'),
    ('32', '7', '1'),
    ('33', '7', '2'),
    ('34', '7', '1'),
    ('35', '7', '1'),
    ('36', '8', '2'),
    ('37', '9', '1'),
    ('38', '9', '1'),
    ('39', '9', '1'),
    ('40', '8', '1'),
    ('41', '7', '1'),
    ('42', '9', '1'),
    ('43', '7', '1'),
    ('44', '9', '2'),
    ('45', '7', '1')
;



# Pizza

INSERT INTO
    taille (id_taille, valeur_taille, label_taille, prix_taille)
VALUES
    ('1', '26', 'petite' , '4'),
    ('2', '33', 'moyenne', '6'),
    ('3', '40', 'grande' , '8')
;

INSERT INTO
    sauce (id_sauce, label_sauce, prix_sauce)
VALUES
    ('1', 'sauce tomate'  , '0'  ),
    ('2', 'sauce fromage' , '0.5'),
    ('3', 'sauce barbecue', '1'  )
;

INSERT INTO
    pate (id_pate, label_pate, prix_pate)
VALUES
    ('1', 'pâte normale' , '0'  ),
    ('2', 'pâte complète', '0.5'),
    ('3', 'pâte fromage' , '1'  )
;

INSERT INTO
    ingredient (id_ingredient, label_ingredient, prix_ingredient)
VALUES
    ('1', 'salade'     , '0.5'),
    ('2', 'oeuf'       , '1'  ),
    ('3', 'fromages'   , '0.5'),
    ('4', 'champignons', '0.5'),
    ('5', 'viandes'    , '1'  )
;

INSERT INTO
    pizza (id_pizza, ref_pate, ref_sauce, ref_taille, ref_menu)
VALUES
    ('1' , '3', '1', '3', '8' ),
    ('2' , '2', '3', '2', '6' ),
    ('3' , '2', '3', '2', '15'),
    ('4' , '2', '2', '2', '22'),
    ('5' , '1', '2', '1', '6' ),
    ('6' , '2', '1', '2', '23'),
    ('7' , '2', '3', '2', '8' ),
    ('8' , '2', '1', '1', '6' ),
    ('9' , '3', '3', '1', '11'),
    ('10', '3', '3', '1', '39'),
    ('11', '2', '1', '2', '12'),
    ('12', '1', '3', '1', '7' ),
    ('13', '1', '3', '1', '5' ),
    ('14', '3', '1', '2', '30'),
    ('15', '3', '1', '2', '11'),
    ('16', '1', '1', '3', '27'),
    ('17', '1', '2', '1', '36'),
    ('18', '1', '1', '1', '12'),
    ('19', '1', '1', '3', '37'),
    ('20', '2', '3', '2', '25'),
    ('21', '3', '2', '1', '42'),
    ('22', '3', '1', '3', '45'),
    ('23', '3', '3', '2', '7' ),
    ('24', '1', '1', '3', '20'),
    ('25', '3', '1', '3', '30'),
    ('26', '3', '3', '1', '30'),
    ('27', '1', '1', '3', '5' ),
    ('28', '1', '2', '2', '42'),
    ('29', '2', '3', '2', '31'),
    ('30', '3', '2', '1', '11'),
    ('31', '2', '3', '1', '13'),
    ('32', '1', '2', '1', '45'),
    ('33', '1', '3', '2', '18'),
    ('34', '3', '3', '3', '5' ),
    ('35', '1', '3', '2', '44')
;

INSERT INTO
    ingredients_pizza (ref_ingredient, ref_pizza, quantite_ingredients)
VALUES
    ('5', '1' , '2'),
    ('1', '2' , '2'),
    ('1', '3' , '2'),
    ('5', '4' , '1'),
    ('4', '5' , '1'),
    ('4', '6' , '1'),
    ('4', '7' , '1'),
    ('1', '8' , '2'),
    ('4', '9' , '1'),
    ('2', '10', '1'),
    ('1', '11', '1'),
    ('3', '12', '1'),
    ('5', '13', '2'),
    ('2', '14', '2'),
    ('5', '15', '1'),
    ('4', '16', '2'),
    ('5', '17', '1'),
    ('3', '18', '2'),
    ('3', '19', '1'),
    ('4', '20', '1'),
    ('1', '21', '2'),
    ('2', '22', '1'),
    ('2', '23', '1'),
    ('5', '24', '1'),
    ('2', '25', '2'),
    ('2', '26', '2'),
    ('2', '27', '2'),
    ('1', '28', '1'),
    ('2', '29', '1'),
    ('3', '30', '2'),
    ('5', '31', '2'),
    ('3', '32', '1'),
    ('1', '33', '1'),
    ('2', '34', '2'),
    ('2', '35', '1'),
    ('4', '5' , '2'),
    ('1', '14', '1'),
    ('3', '22', '1'),
    ('5', '27', '2'),
    ('1', '29', '1'),
    ('3', '32', '2'),
    ('2', '5' , '2'),
    ('2', '18', '2'),
    ('4', '5' , '2'),
    ('3', '32', '1'),
    ('5', '3' , '2'),
    ('2', '15', '2'),
    ('4', '26', '2'),
    ('4', '6' , '1'),
    ('5', '26', '2'),
    ('5', '15', '2'),
    ('5', '25', '1'),
    ('1', '1' , '1'),
    ('1', '24', '2'),
    ('1', '11', '2'),
    ('1', '11', '1'),
    ('3', '26', '1'),
    ('3', '19', '1'),
    ('5', '18', '2'),
    ('1', '2' , '1'),
    ('5', '31', '2'),
    ('3', '3' , '1'),
    ('2', '16', '1'),
    ('2', '9' , '1'),
    ('3', '6' , '2'),
    ('5', '13', '2'),
    ('2', '28', '1'),
    ('1', '13', '1'),
    ('5', '16', '1'),
    ('4', '8' , '2'),
    ('5', '24', '2')
;