# FIX.md - Rapport de correction

**Temps total passé sur l'exercice :** environ 3h

---

## Bug 1 - Le compteur de tâches restantes est incorrect

**Symptôme** : L'application affiche "1 tâche(s) restante(s) sur 4" alors qu'en réalité 3 tâches sur 4 ne sont pas encore cochées.

**Cause** : Dans App.jsx, la ligne `const nombreRestantes = taches.filter((t) => t.terminee).length` garde les tâches où `terminee` vaut `true` (donc déjà terminées), alors que la variable est censée compter les tâches non terminées. La condition du filtre est inversée par rapport à ce qu'elle devrait vérifier.

**Correction** : J'ai remplacé `t.terminee` par `!t.terminee` dans le filtre, pour qu'il garde les tâches où `terminee` vaut `false` et calcule donc le bon nombre de tâches restantes. Réécrire tout le calcul autrement (par exemple `taches.length - taches.filter(t => t.terminee).length`) aurait fonctionné aussi mais aurait nécessité de calculer l'inverse puis de soustraire (plus long).

---

## Bug 2 - Une mauvaise tâche se retrouve cochée après suppression d'une autre

**Symptôme** : Quand je supprime une tâche au milieu de la liste, une autre tâche se retrouve cochée comme terminée à tort (sans que j'aie cliqué dessus).

**Cause** : Dans composants/ListeTaches.jsx (ligne 18), le `.map()` qui génère la liste des `<Tache />` ne fournit aucune prop `key`. Sans key unique, React ne peut pas identifier chaque tâche individuellement, il se base sur la position dans la liste plutôt que sur l'identité réelle de chaque élément. Après une suppression, les tâches suivantes "remontent" d'un rang, et React associe à tort l'état visuel (coché/pas coché) d'une position à la mauvaise tâche.

**Correction** : J'ai ajouté `key={tache.id}` sur le composant `<Tache />`.

---

## Bug 3 - Impossible de cocher ou décocher une tâche

**Symptôme** : Il est impossible de cliquer pour cocher ou décocher une case.

**Cause** : Dans App.jsx, la fonction `basculerTache` modifiait directement l'objet existant dans le tableau (`tache.terminee = !tache.terminee`), puis rappelait `setTaches(taches)` avec ce même tableau, donc la même référence en mémoire. React compare les states par référence, pas par contenu : voyant l'ancienne et la nouvelle référence identiques, il ne détecte aucun changement et ne relance pas de re-render, même si la donnée avait techniquement changé.

**Correction** : J'ai remplacé la fonction pour utiliser `.map()` et créer un nouveau tableau, avec un nouvel objet pour la tâche concernée (`{ ...t, terminee: !t.terminee }`) et les autres tâches inchangées.

---

## Bug 4 - La page se recharge en ajoutant une tâche, et la tâche n'apparaît pas

**Symptôme** : En cliquant sur "Ajouter" (ou en appuyant sur Entrée) après avoir saisi une tâche, la page se recharge entièrement (comme un F5), et la nouvelle tâche n'apparaît jamais dans la liste.

**Cause** : Dans composants/FormulaireTache.jsx, la fonction appelée à la soumission du formulaire n'empêchait pas le comportement par défaut du navigateur. Or, par défaut, valider un formulaire recharge toute la page — ce qui remet l'application à zéro et fait perdre l'ajout.

**Correction** : J'ai ajouté `e.preventDefault()` en toute première ligne de `envoyer`, avant tout autre traitement, pour bloquer le rechargement natif dès la soumission et laisser React gérer l'ajout de la tâche dans le state.

---

## Bug 5 - Le chronomètre continue de tourner même quand il ne devrait plus

**Symptôme** : le composant Chrono (le "Temps passé sur la page") lance un minuteur qui tourne indéfiniment, sans jamais s'arrêter proprement.

**Cause** : Dans composants/Chrono.jsx, le `useEffect` démarre un `setInterval` mais ne l'arrête jamais. Normalement, quand on lance un minuteur comme ça dans un composant, il faut aussi dire à React comment l'arrêter s'il n'est plus nécessaire. Ici, cette étape manquait, donc le minuteur continuait de tourner en arrière-plan pour rien.

**Correction** : J'ai récupéré l'identifiant renvoyé par `setInterval`, et j'ai ajouté une fonction de nettoyage (retournée par le `useEffect`) qui appelle `clearInterval` avec cet identifiant, pour que le minuteur s'arrête proprement quand ce n'est plus nécessaire.

---

## Ce que je n'ai pas réussi / ce qui me reste des doutes

J'ai trouvé assez facilement les causes des bugs par rapport à plusieurs tests effectués, mais j'ai dû m'aider pour retrouver les codes qui étaient en lien avec ces problèmes-là.
