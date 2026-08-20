# API de signalement de bugs

> Squelette du README à livrer avec ton API. Remplis chaque section, supprime les commentaires
> entre parenthèses, et renomme ce fichier en `README.md` dans ton dépôt.
> On doit pouvoir cloner ton projet et le faire tourner **sans te poser une seule question**.

## Prérequis

(Version de Node, base de données utilisée et comment l'installer)

## Installation

```bash
npm install
```

## Configuration

(Explique quoi copier et quoi remplir)

```bash
cp .env.example .env
```

| Variable | Rôle | Exemple |
|---|---|---|
| ... | ... | ... |

## Lancer le serveur

```bash
npm start
```

L'API écoute sur `http://localhost:3000`.

## Base de données

**Choix retenu :** (PostgreSQL ou SQLite)

**Pourquoi :** (deux phrases suffisent — c'est le raisonnement qui m'intéresse, pas la réponse)

(Comment créer la table : script, commande, migration...)

## Tester les routes

### Créer un signalement

```bash
curl -X POST http://localhost:3000/bugs \
  -H "Content-Type: application/json" \
  -d '{"titre":"Le bouton ne répond pas","description":"Rien ne se passe au clic","severite":"haute"}'
```

### Lister les signalements

```bash
curl http://localhost:3000/bugs
curl "http://localhost:3000/bugs?statut=ouvert"
```

### Récupérer un signalement

```bash
curl http://localhost:3000/bugs/1
```

### Changer le statut

```bash
curl -X PATCH http://localhost:3000/bugs/1 \
  -H "Content-Type: application/json" \
  -d '{"statut":"en_cours"}'
```

### Supprimer

```bash
curl -X DELETE http://localhost:3000/bugs/1
```

## Codes HTTP renvoyés

(Liste les codes que ton API renvoie et dans quels cas — c'est un critère d'évaluation)

| Code | Quand |
|---|---|
| 201 | ... |
| 400 | ... |
| 404 | ... |

## Ce que je n'ai pas réussi

(Sois franche ici, ça compte en ta faveur — pas contre toi.)

## Temps passé

... h
