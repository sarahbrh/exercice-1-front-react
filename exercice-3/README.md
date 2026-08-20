# Exercice 3 — Brancher le front sur l'API · **BONUS**

📄 **Lis d'abord l'énoncé complet : [`Exercice-3-Integration.pdf`](Exercice-3-Integration.pdf)**

> **Exercice facultatif.** Ne t'y attaque que si les exercices 1 et 2 sont terminés et rendus :
> ce sont eux qui comptent. Pas de date imposée ici — préviens-nous simplement si tu le fais.

## Contenu de ce dossier

| Fichier | Rôle |
|---|---|
| `Exercice-3-Integration.pdf` | L'énoncé complet |
| `POINTS-DE-CONTROLE.md` | La liste des points à vérifier avant de rendre |

Il n'y a pas de code de départ : tu repars de **tes deux rendus précédents**.

## En résumé

Ton front React (exercice 1) et ton API (exercice 2) ne se sont jamais parlé. Il s'agit de les brancher.

Un point à ne pas manquer : **l'appli de l'exercice 1 gère des tâches, ton API gère des signalements de
bugs.** Ce ne sont pas les mêmes données, et c'est volontaire. Une partie du travail consiste à adapter
le front au modèle réel de l'API — ce qui arrive à chaque fois qu'on branche une interface sur une API
qui existait déjà.

## Les trois points qui comptent vraiment

1. **L'état de chargement** — l'utilisateur voit qu'il se passe quelque chose.
2. **L'état d'erreur** — éteins ton serveur, recharge : l'appli doit afficher un message clair,
   pas un écran blanc. C'est le test le plus important.
3. **L'adresse de l'API dans une variable d'environnement**, jamais en dur dans le code.

Et tu vas rencontrer **CORS**. C'est normal, c'est voulu, et on attend que tu l'expliques dans ton
README avec tes propres mots.
