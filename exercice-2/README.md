# Exercice 2 — Construire une API de signalement de bugs

📄 **Lis d'abord l'énoncé complet : [`Exercice-2-Back-API.pdf`](Exercice-2-Back-API.pdf)**

## Contenu de ce dossier

| Fichier | Rôle |
|---|---|
| `Exercice-2-Back-API.pdf` | L'énoncé complet, le modèle de données, les routes attendues |
| `MODELE-README.md` | Le squelette du `README.md` que tu dois livrer avec ton API |
| `verifier-mon-api.sh` | **Un script pour tester ton API toi-même** avant de me la rendre |

Ici tu pars d'un dossier vide : il n'y a pas de code de départ, c'est voulu.

## En résumé

Une API REST qui gère des signalements de bugs. Cinq routes :

| Route | Rôle |
|---|---|
| `POST /bugs` | Créer un signalement |
| `GET /bugs` | Lister, avec filtre optionnel : `GET /bugs?statut=ouvert` |
| `GET /bugs/:id` | Récupérer un signalement précis |
| `PATCH /bugs/:id` | Changer le statut |
| `DELETE /bugs/:id` | Supprimer |

Les exigences détaillées (validation, codes HTTP, `.env`) sont dans le PDF. Lis-les vraiment :
c'est là que se joue la note, pas dans le nombre de routes.

## Vérifie ton travail avant de me l'envoyer

Lance ton serveur sur le port 3000, puis, depuis ce dossier :

```bash
chmod +x verifier-mon-api.sh
./verifier-mon-api.sh
```

Le script appelle tes routes et compare le code HTTP obtenu à celui attendu.

**Ce script n'est pas une note.** Il ne teste que les cas les plus évidents, et il ne vérifie ni la
qualité de ton code, ni ton README, ni tes commits. Il est là pour t'éviter de me livrer une API
qui plante au premier appel. Si un test échoue et que tu n'as pas le temps de le corriger,
dis-le simplement dans ton README — c'est mieux que de faire comme si de rien n'était.

## Ce qui n'est pas demandé

Pas d'authentification, pas de front-end, pas de déploiement, pas de Docker, pas de tests automatisés.
**Cinq routes qui font exactement ce qu'elles annoncent, c'est tout ce que nous voulons voir.**
