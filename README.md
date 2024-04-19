# Streaming Database

Ce dépôt contient la structure de base de données pour un système de streaming vidéo, comprenant des informations sur les films, les acteurs, les réalisateurs et les utilisateurs.

## MCD
![MCD](https://github.com/simplon-lille-csharp-dotnet/Streaming-MF/assets/150059186/656239d0-6dd5-4108-b35f-62c1cbb18b48)
<br> <br>
## MLD
![MLD](https://github.com/simplon-lille-csharp-dotnet/Streaming-MF/assets/150059186/0c7cee9c-6c79-446c-a91d-bd2578091980)
<br> <br>
## MPD
![MPD](https://github.com/simplon-lille-csharp-dotnet/Streaming-MF/assets/150059186/0e9df60f-8707-42ff-bb43-91414cd6e965)

## Prérequis
Avant de commencer, assurez-vous d'avoir XAMPP installé sur votre machine. XAMPP fournit un environnement de développement local avec Apache, MySQL, PHP et PhpMyAdmin.

## Lancement

### Lancer XAMPP :

XAMPP : https://sourceforge.net/projects/xampp/

MySQL : https://www.mysql.com/fr/downloads/

* Démarrez le serveur Apache et MySQL via le panneau de contrôle XAMPP.

* Importer la base de données :

Ouvrez PhpMyAdmin dans votre navigateur en accédant à http://localhost/phpmyadmin.
Créez une nouvelle base de données.

### Pour ajouter une table (par exemple la table des acteurs) insérez :

CREATE TABLE `acteurs` (<br>
  `acteur_id` int(11) NOT NULL,<br>
  `nom` varchar(255) NOT NULL,<br>
  `prenom` varchar(255) NOT NULL,<br>
  `role` varchar(255) DEFAULT NULL,<br>
  `date_naissance` date DEFAULT NULL,<br>
  `date_creation` datetime DEFAULT current_timestamp(),<br>
  `date_modification` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()<br>
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

### Pour ajouter une clé primaire insérez :

ALTER TABLE `acteurs`
  ADD PRIMARY KEY (`acteur_id`);

### Pour ajouter une auto incrémentation insérez :

ALTER TABLE `acteurs`
  MODIFY `acteur_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

  ### Pour ajouter une clé étrangère insérez :
  
 ALTER TABLE `films`
  ADD CONSTRAINT `films_ibfk_1` FOREIGN KEY (`realisateur_id`) REFERENCES `realisateurs` (`realisateur_id`);

## Données

### Pour ajouter des données dans une table (par exemple pour la table des acteurs) insérez :

INSERT INTO `acteurs` (`acteur_id`, `nom`, `prenom`, `role`, `date_naissance`, `date_creation`, `date_modification`) VALUES<br>
(1, 'DiCaprio', 'Leonardo', 'Acteur principal', '1974-11-11', '2023-12-14 09:26:45', '2023-12-14 09:26:45'),<br>
(2, 'Jackson', 'Samuel L.', 'Acteur principal', '1948-12-21', '2023-12-14 09:26:45', '2023-12-14 09:26:45'),<br>
(3, 'Neill', 'Sam', 'Acteur principal', '1947-09-14', '2023-12-14 09:26:45', '2023-12-14 09:26:45'),<br>
(4, 'Brando', 'Marlon', 'Acteur principal', '1924-04-03', '2023-12-14 09:26:45', '2023-12-14 09:26:45'),<br>
(5, 'De Niro', 'Robert', 'Acteur principal', '1943-08-17', '2023-12-14 09:26:45', '2023-12-14 09:26:45'),<br>
(6, 'Pattinson', 'Robert', 'Acteur principal', '1986-05-13', '2023-12-14 10:12:08', '2023-12-14 10:12:08'),<br>
(7, 'Elgort', 'Ansel', 'Acteur secondaire', '1995-01-01', '2023-12-14 10:16:08', '2023-12-14 10:16:08');

## Requêtes
### Requêtes pour la table Films : 

* Titres et dates de sortie des films du plus récent au plus ancien :

**SELECT titre, annee_sortie FROM Films ORDER BY annee_sortie DESC;**

* Ajouter un film :

**INSERT INTO Films (titre, realisateur_id, duree, annee_sortie) VALUES ('Nouveau Film', 1, 120, 2022);**

* Modifier un film :

**UPDATE Films SET titre = 'Nouveau Titre' WHERE film_id = 1;**

* Supprimer un film :

**DELETE FROM Films WHERE film_id = 1;**

### Requêtes pour la table Acteurs :


* Noms, prénoms et âges des acteurs/actrices de plus de 30 ans dans l'ordre alphabétique :

**SELECT CONCAT(prenom, ' ', nom) AS nom_complet, TIMESTAMPDIFF(YEAR, date_naissance, CURDATE()) AS age FROM Acteurs WHERE TIMESTAMPDIFF(YEAR, date_naissance, CURDATE()) > 30 ORDER BY nom, prenom;**


* Ajouter un acteur/actrice :

**INSERT INTO Acteurs (nom, prenom, role, date_naissance) VALUES ('Nouveau', 'Acteur', 'Nouveau Rôle', '1990-01-01');**

* Modifier un acteur/actrice :

**UPDATE Acteurs SET role = 'Nouveau Rôle' WHERE acteur_id = 1;**


* Supprimer un acteur/actrice :
  
**DELETE FROM Acteurs WHERE acteur_id = 1;**

* Afficher les 3 derniers acteurs/actrices ajouté(e)s :
  
**SELECT nom, prenom, date_naissance FROM Acteurs ORDER BY date_creation DESC LIMIT 3;**


### Requêtes pour la table Realisateurs :

* Ajouter un réalisateur :

**INSERT INTO Realisateurs (nom, prenom) VALUES ('Nouveau', 'Realisateur');**

### Requêtes pour la table Utilisateurs :

* Ajouter un utilisateur :

**INSERT INTO Utilisateurs (email, mot_de_passe, liste_films_preferes) VALUES ('nouveau@email.com', 'motdepasse', 'Film1, Film2, Film3');**

### Autres requêtes : 

* Vérifier si un des acteurs a joué dans un des films :
  
**SELECT DISTINCT a.nom, a.prenom, f.titre
FROM acteurs a
JOIN filmsacteurs fa ON a.acteur_id = fa.acteur_id
JOIN films f ON fa.film_id = f.film_id
WHERE a.nom = '@nom_acteur' AND a.prenom = '@prenom_acteur';**

* Calculer la moyenne du nombre de films des acteurs/trices de plus de 50 ans :
  
**SELECT AVG(nombre_films) AS moyenne_films
FROM (
    SELECT a.acteur_id, COUNT(*) AS nombre_films
    FROM acteurs a
    JOIN filmsacteurs fa ON a.acteur_id = fa.acteur_id
    JOIN films f ON fa.film_id = f.film_id
    WHERE TIMESTAMPDIFF(YEAR, a.date_naissance, CURDATE()) > 50
    GROUP BY a.acteur_id
) AS acteurs_plus_de_50;**

## Conclusion

Merci d'avoir exploré notre projet!
