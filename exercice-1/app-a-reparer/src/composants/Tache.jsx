export default function Tache({ tache, onBasculer, onSupprimer }) {
  return (
    <li className={tache.terminee ? 'tache terminee' : 'tache'}>
      <label>
        <input
          type="checkbox"
          checked={tache.terminee}
          onChange={() => onBasculer(tache.id)}
        />
        <span>{tache.titre}</span>
      </label>
      <button
        type="button"
        className="supprimer"
        onClick={() => onSupprimer(tache.id)}
        aria-label={'Supprimer ' + tache.titre}
      >
        x
      </button>
    </li>
  )
}
