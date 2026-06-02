CREATE TABLE skis
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
	path TEXT NOT NULL,
    sizes TEXT NOT NULL,
    stock INT
);

CREATE TABLE chaussures
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  path TEXT NOT NULL,
  sizes TEXT NOT NULL,
  stock INT
);

CREATE TABLE batons
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  path TEXT NOT NULL,
  sizes TEXT NOT NULL,
  stock INT
);

INSERT INTO skis (name, path, sizes, stock) VALUES
('Salomon QST', 'assets/skis/QST_PARK_S.png', '142,148,152,158,162,172,178', 100),
('Atomic Bent', 'assets/skis/s_qst_x.png', '141,151,158,163,166,171,175', 65),
('Rossignol Hero', 'assets/skis/stance80.png', '140,145,150,155,160,170,175', 80);

INSERT INTO chaussures (name, path, sizes, stock) VALUES
('Lange RS', 'assets/shoes/shoes0.png', '38,39,40,41,42,43,44,45', 22),
('Nordica Dobermann', 'assets/shoes/shoes1.png', '38,39,40,41,42,43,44,45,46', 18),
('Salomon X Pro', 'assets/shoes/shoes2.png', '38,39,40,41,42,43,44', 15);

INSERT INTO batons (name, path, sizes, stock) VALUES
('Leki Spark', 'assets/sticks/sticks0.png', '105,110,115,120,125', 200),
('Scott Team Issue', 'assets/sticks/sticks1.png', '105,110,115,120,125,130', 170),
('Dynastar Speedtour', 'assets/sticks/sticks2.png', '100,120', 170);