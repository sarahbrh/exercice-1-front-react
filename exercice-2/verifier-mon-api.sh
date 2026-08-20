#!/usr/bin/env bash
# Verifie que ton API repond correctement sur les cas les plus evidents.
# Lance ton serveur sur le port 3000, puis : ./verifier-mon-api.sh

BASE="${1:-http://localhost:3000}"
OK=0
KO=0

verifier() {
  local libelle="$1" attendu="$2" obtenu="$3"
  if [ "$obtenu" = "$attendu" ]; then
    printf '  \033[32mOK\033[0m   %-52s (%s)\n' "$libelle" "$obtenu"
    OK=$((OK + 1))
  else
    printf '  \033[31mKO\033[0m   %-52s attendu %s, obtenu %s\n' "$libelle" "$attendu" "$obtenu"
    KO=$((KO + 1))
  fi
}

code() { curl -s -o /dev/null -w '%{http_code}' "$@"; }

# Certains codes ont plusieurs reponses acceptables (ex : 200 ou 204 sur DELETE).
verifier_parmi() {
  local libelle="$1" attendus="$2" obtenu="$3"
  case " $attendus " in
    *" $obtenu "*)
      printf '  \033[32mOK\033[0m   %-52s (%s)\n' "$libelle" "$obtenu"; OK=$((OK + 1)) ;;
    *)
      printf '  \033[31mKO\033[0m   %-52s attendu %s, obtenu %s\n' "$libelle" "${attendus// / ou }" "$obtenu"
      KO=$((KO + 1)) ;;
  esac
}

echo
echo "Verification de $BASE"
echo

if ! curl -s -o /dev/null --max-time 3 "$BASE/bugs"; then
  echo "  Impossible de joindre $BASE"
  echo "  Ton serveur est-il demarre ? Ecoute-t-il bien sur ce port ?"
  echo
  exit 1
fi

echo "Creation"
CORPS='{"titre":"Le bouton ne repond pas","description":"Rien ne se passe au clic","severite":"haute"}'
REPONSE=$(curl -s -X POST "$BASE/bugs" -H 'Content-Type: application/json' -d "$CORPS")
verifier "POST /bugs avec un corps valide" 201 \
  "$(code -X POST "$BASE/bugs" -H 'Content-Type: application/json' -d "$CORPS")"

ID=$(printf '%s' "$REPONSE" | sed -n 's/.*"id"[[:space:]]*:[[:space:]]*"\{0,1\}\([^,"}]*\).*/\1/p' | head -1)
if [ -z "$ID" ]; then
  echo "     (aucun id trouve dans la reponse : renvoies-tu bien la ressource creee ?)"
  ID=1
fi

echo
echo "Lecture"
verifier "GET  /bugs" 200 "$(code "$BASE/bugs")"
verifier "GET  /bugs?statut=ouvert" 200 "$(code "$BASE/bugs?statut=ouvert")"
verifier "GET  /bugs/\$id sur un id existant" 200 "$(code "$BASE/bugs/$ID")"
verifier "GET  /bugs/999999 sur un id inconnu" 404 "$(code "$BASE/bugs/999999")"

echo
echo "Validation des entrees"
verifier "POST /bugs sans titre" 400 \
  "$(code -X POST "$BASE/bugs" -H 'Content-Type: application/json' \
     -d '{"titre":"","description":"vide","severite":"basse"}')"
verifier "POST /bugs avec une severite inventee" 400 \
  "$(code -X POST "$BASE/bugs" -H 'Content-Type: application/json' \
     -d '{"titre":"Test","description":"test","severite":"catastrophique"}')"
verifier "POST /bugs sans description" 400 \
  "$(code -X POST "$BASE/bugs" -H 'Content-Type: application/json' \
     -d '{"titre":"Test","severite":"basse"}')"

echo
echo "Mise a jour et suppression"
verifier "PATCH /bugs/\$id vers en_cours" 200 \
  "$(code -X PATCH "$BASE/bugs/$ID" -H 'Content-Type: application/json' -d '{"statut":"en_cours"}')"
verifier "PATCH /bugs/\$id avec un statut invalide" 400 \
  "$(code -X PATCH "$BASE/bugs/$ID" -H 'Content-Type: application/json' -d '{"statut":"termine_peut_etre"}')"
verifier "PATCH /bugs/999999 sur un id inconnu" 404 \
  "$(code -X PATCH "$BASE/bugs/999999" -H 'Content-Type: application/json' -d '{"statut":"resolu"}')"
verifier_parmi "DELETE /bugs/\$id" "200 204" "$(code -X DELETE "$BASE/bugs/$ID")"
verifier "DELETE /bugs/999999 sur un id inconnu" 404 "$(code -X DELETE "$BASE/bugs/999999")"

echo
echo "-------------------------------------------------------"
printf '  %s reussis, %s echoues\n' "$OK" "$KO"
echo "-------------------------------------------------------"
echo
echo "  Rappel : ce script ne verifie ni la qualite de ton code,"
echo "  ni ton README, ni tes commits. Ce n'est pas une note."
echo
[ "$KO" -eq 0 ]
