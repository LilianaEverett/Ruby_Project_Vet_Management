DROP TABLE IF EXISTS patients;
DROP TABLE IF EXISTS vets;
DROP TABLE IF EXISTS owners;


CREATE TABLE vets
(
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL
);

CREATE TABLE owners
(
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  contact VARCHAR(255) NOT NULL
);

CREATE TABLE patients
(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  type VARCHAR(255) NOT NULL,
  db VARCHAR(255),
  owner_id INT4 REFERENCES owners(id),
  vet_id INT4 REFERENCES vets(id),
  notes varchar,
  pic VARCHAR
);
