# GetX Todo APP

Ceci est une application mobile de gestion de tâches, développée avec Flutter et le framework GetX.

## Description

Le but de ce projet est de démontrer l'utilisation du pattern GetX pour la structure du code source de l'application, afin qu'il soit facilement gérable, que les fichiers ne soient pas lourds ou longs et que l'ensemble communique sans trop de mal.

## Structure de code

Dans ce projet, nous avons utilisé le pattern GetX pour la structure de code. Le pattern GetX est une alternative au pattern MVC (Model-View-Controller) pour la gestion d'états dans les applications Flutter. Il est basé sur le modèle MVVM (Model-View-ViewModel) mais utilise des contrôleurs (Controllers) pour gérer l'état de l'application.

Dans ce pattern, chaque page (View) de l'application a un contrôleur (Controller) qui gère l'état de la page. Le contrôleur est responsable de la logique métier, de la récupération des données et de la mise à jour de l'état de la page. Les pages sont donc passives et ne contiennent pas de logique métier.

Le pattern GetX est facile à utiliser, car il ne nécessite pas beaucoup de code boilerplate( ***des sections de code qui sont répétées à plusieurs endroits avec peu ou pas de variation.*** ),  et il est également très performant, car il utilise des observables pour la mise à jour de l'interface utilisateur, et une bonne gestion des états de l'application.

> De manniere globale , la strucutre est la suivante :

![Structure de base Getx Pattern](./assets/readme/GetX_Structure.jpg)

> Appliquée à ce projet, nous obtenons ce qui suit :

### app
Le répertoire qui contenir tous les dossiers de notre application.
#### data
Dossier responsable de contenir tout ce aui est relatif aux données.
![Dossier app/data](./assets/readme/dossier%20data.png)

En l'occurence, il s'agit des **modèles** (Le modèle de nos tâches) , des **providers** ( qui se charge de fournir le service de stockage. Il peut aussi s'agir d'une api ) des **services** (Le service de stockage de nos tâches en mémoire).

#### modules
Chaque module se compose d'une page, de son GetXController respectif et de ses dépendances ou liaisons(Bindings).
***Le dossier Binding contient ici les classes pour l'injection de dépendances***
##### Exemple : Le module home



#### routes
#### widgets

### core
#### utils
#### values



## Fonctionnalités de l'application

- Ajout, et modification de tâches
- Marquer les choses à faire comme terminées 
- Supprimer les choses à faire en faisant un slide vers la gauche
- Ajouter et supprimer des types de tâches
- Affichage de la liste des tâches
- Affichage de la liste d'un rapport sur les tâches

## Installation du dépôt

- Clonez le projet depuis GitHub: `git clone https://github.com/votre-nom/getx-todo-app.git`
- Installez les dépendances: `flutter pub get`
- Exécutez l'application: `flutter run`


## Installation de l'application.
Vous pouvez téléchqrger l'application pour les appareils android ICI.

## Contribution

Les contributions sont les bienvenues! Si vous souhaitez contribuer à ce projet, veuillez suivre les étapes suivantes:

1. Fork du projet
2. Créez une branche pour votre fonctionnalité: `git checkout -b feature/nouvelle-fonctionnalité`
3. Effectuez vos modifications et effectuez un commit: `git commit -am "Ajout de la nouvelle fonctionnalité"`
4. Poussez les modifications vers votre branche: `git push origin feature/nouvelle-fonctionnalité`
5. Créez une demande de tirage (pull request)

## Crédits

Ce projet a été développé par Marcel pour démontrer l'utilisation du pattern GetX dans le développement d'applications mobiles avec Flutter.

## Licence

Ce projet est sous licence MIT. Veuillez consulter le fichier `LICENSE` pour plus d'informations.
