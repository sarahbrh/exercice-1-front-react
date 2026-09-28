import { useState } from "react";

export default function FormulaireTache({ onAjouter }) {
  const [titre, setTitre] = useState("");

  function envoyer(e) {
    e.preventDefault();
    if (titre.trim() === "") {
      return;
    }
    onAjouter(titre.trim());
    setTitre("");
  }

  return (
    <form className="formulaire" onSubmit={envoyer}>
      <input
        type="text"
        value={titre}
        placeholder="Ajouter une tache..."
        onChange={(e) => setTitre(e.target.value)}
      />
      <button type="submit">Ajouter</button>
    </form>
  );
}
