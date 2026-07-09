CREATE TABLE IF NOT EXISTS categorie (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS domande (
  id SERIAL PRIMARY KEY,
  categoria_id INTEGER NOT NULL REFERENCES categorie(id),
  difficolta VARCHAR(20) NOT NULL CHECK (difficolta IN ('facile', 'medio', 'difficile')),
  domanda TEXT NOT NULL,
  risposta_corretta TEXT NOT NULL,
  risposta_errata_1 TEXT NOT NULL,
  risposta_errata_2 TEXT NOT NULL,
  risposta_errata_3 TEXT NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_domande_categoria ON domande(categoria_id);
CREATE INDEX IF NOT EXISTS idx_domande_difficolta ON domande(difficolta);
