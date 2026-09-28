# Exercice 1 - Réparer une application React

## Lancer le projet

```bash
cd app-a-reparer
npm install
npm run dev
```

Puis ouvrir l'adresse affichée dans le terminal (par défaut `http://localhost:5173`) dans le navigateur.

## Ce que j'ai fait

J'ai utilisé l'application comme un utilisateur normal (ajout, suppression, coche des tâches). Certains bugs ont été repérés par déduction du comportement anormal (compteur faux, case qui ne réagit pas, etc.), d'autres grâce à des messages dans la console du navigateur (warning React sur la `key` manquante, erreur JS). Le détail de chaque bug (symptôme, cause, correction) se trouve dans `FIX.md`.

Bugs corrigés (un commit par bug) :

- Le compteur de tâches restantes affichait un mauvais chiffre
- Une mauvaise tâche se retrouvait cochée après suppression d'une autre (key manquante)
- Impossible de cocher/décocher une tâche (mutation directe du state)
- La page se rechargeait en ajoutant une tâche (preventDefault manquant)
- Le chronomètre ne s'arrêtait jamais proprement (fuite mémoire)

Je me suis aidée de Claude pour comprendre le fonctionnement de React (props `key`, immutabilité du state, `useEffect`) et localiser les fichiers concernés par chaque bug.

## Ce que je n'ai pas réussi

Le bonus (filtre toutes / en cours / terminées) n'a pas été fait.

## Temps passé

Environ 3h.
