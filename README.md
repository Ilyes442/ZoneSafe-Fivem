SafeZone Script for FiveM (ESX Legacy)
Description
Ce script ajoute une SafeZone interactive et responsive dans votre serveur FiveM utilisant ESX Legacy. La SafeZone protège les joueurs des attaques et leur permet de rester en sécurité dans une zone spécifique tout en offrant une interface NUI responsive.

Features
Protection complète dans la SafeZone (immunité contre les dégâts).
NUI responsive pour un affichage optimisé sur tous les appareils.
Facilement configurable pour adapter la taille et l'emplacement de la SafeZone.
ESX Legacy compatible – utilise des dépendances ESX pour une intégration fluide.
Notification lorsqu'un joueur entre ou sort de la SafeZone.
Prérequis
ESX Legacy correctement installé.

Installation
Clonez ou téléchargez ce dépôt dans votre dossier resources.

bash
Copier le code
git clone https://github.com/votre-compte/ZoneSafe.git
Ajoutez le dossier du script dans votre server.cfg :

bash
Copier le code
ensure ZoneSafe
Assurez-vous que ESX Legacy est bien installé sur votre serveur.

Configurez les coordonnées et la taille de la SafeZone dans le fichier cl_zonesafe.lua :

Utilisation
Lorsque les joueurs entrent dans la SafeZone, ils recevront une notification et seront protégés.
À la sortie de la SafeZone, ils perdront cette protection.
L'interface NUI affiche dynamiquement l'état du joueur par rapport à la zone de sécurité.
Crédits
Script développé par Ilyes.
Basé sur le framework ESX Legacy et utilisant NUI pour une interface utilisateur moderne.
