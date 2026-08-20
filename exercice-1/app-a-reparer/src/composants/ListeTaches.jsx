import Tache from './Tache.jsx'

export default function ListeTaches({ taches, onBasculer, onSupprimer }) {
  if (taches.length === 0) {
    return <p className="vide">Aucune tache pour le moment.</p>
  }

  return (
    <ul className="liste">
      {taches.map((tache) => (
        <Tache
          tache={tache}
          onBasculer={onBasculer}
          onSupprimer={onSupprimer}
        />
      ))}
    </ul>
  )
}
