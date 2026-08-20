import { useState } from 'react'
import { tachesInitiales } from './donnees.js'
import Chrono from './composants/Chrono.jsx'
import FormulaireTache from './composants/FormulaireTache.jsx'
import ListeTaches from './composants/ListeTaches.jsx'

export default function App() {
  const [taches, setTaches] = useState(tachesInitiales)

  function ajouterTache(titre) {
    const nouvelle = {
      id: Date.now(),
      titre: titre,
      terminee: false,
    }
    setTaches([...taches, nouvelle])
  }

  function basculerTache(id) {
    const tache = taches.find((t) => t.id === id)
    tache.terminee = !tache.terminee
    setTaches(taches)
  }

  function supprimerTache(id) {
    setTaches(taches.filter((t) => t.id !== id))
  }

  const nombreRestantes = taches.filter((t) => t.terminee).length

  return (
    <main className="app">
      <header className="entete">
        <h1>Ma liste de taches</h1>
        <Chrono />
      </header>

      <FormulaireTache onAjouter={ajouterTache} />

      <ListeTaches
        taches={taches}
        onBasculer={basculerTache}
        onSupprimer={supprimerTache}
      />

      <p className="compteur">
        {nombreRestantes} tache(s) restante(s) sur {taches.length}
      </p>
    </main>
  )
}
