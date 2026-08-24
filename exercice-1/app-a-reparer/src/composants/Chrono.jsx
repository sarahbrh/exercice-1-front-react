import { useEffect, useState } from "react";

export default function Chrono() {
  const [secondes, setSecondes] = useState(0);

  useEffect(() => {
    const id = setInterval(() => {
      setSecondes((s) => s + 1);
    }, 1000);
    return () => clearInterval(id);
  }, []);

  const minutes = Math.floor(secondes / 60);
  const reste = secondes % 60;

  return (
    <span className="chrono">
      Temps passe sur la page : {minutes}m {reste}s
    </span>
  );
}
