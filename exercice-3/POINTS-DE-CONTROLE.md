# Points de contrôle — exercice 3

À passer en revue **avant** d'ouvrir ta Pull Request. Coche ce qui est fait, et note franchement
ce qui ne l'est pas : un point non traité mais signalé vaut mieux qu'un point non traité et caché.

## Les appels à l'API

- [ ] La liste s'affiche au chargement de la page, depuis `GET /bugs`
- [ ] Créer un signalement appelle `POST /bugs` et la liste se met à jour ensuite
- [ ] Changer le statut appelle `PATCH /bugs/:id`
- [ ] Supprimer appelle `DELETE /bugs/:id`
- [ ] Après chaque action, ce qui est à l'écran correspond à ce qu'il y a en base
      (recharge la page pour t'en assurer)

## Le comportement quand ça se passe mal

- [ ] Pendant le chargement initial, l'utilisateur voit un indicateur — pas une page vide
- [ ] **Serveur éteint + rechargement de la page** → message d'erreur lisible, aucune page blanche
- [ ] Une action qui échoue (serveur coupé en cours d'utilisation) ne casse pas l'affichage
- [ ] Aucune erreur rouge non gérée dans la console du navigateur

## La configuration

- [ ] L'adresse de l'API vient d'une variable d'environnement, jamais écrite en dur
- [ ] Un `.env.example` documente la clé attendue
- [ ] Le `.env` est bien dans le `.gitignore` et n'apparaît **dans aucun commit**
      (vérifie avec `git log --all --full-history -- .env`)

## CORS

- [ ] Le problème est corrigé côté serveur
- [ ] Ton README explique ce qu'est CORS **avec tes propres mots**, et pourquoi ça existe

## Le rendu

- [ ] Le README explique comment lancer les deux parties, dans l'ordre
- [ ] Tu as justifié ton choix d'affichage pour les trois statuts
- [ ] Tu as répondu par écrit à la question du double-clic sur Supprimer
- [ ] Commits atomiques, sur une branche, Pull Request ouverte et **non mergée**
- [ ] Le temps passé est indiqué
