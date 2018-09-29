DROP TABLE IF EXISTS stock;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS manufacturers;

CREATE TABLE items (
  id SERIAL4 PRIMARY KEY,
  product VARCHAR(255),
  category VARCHAR(255),
  costprice INT4,
  sellprice INT4
);

CREATE TABLE manufacturers (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  sector VARCHAR(255)
);

CREATE TABLE stock (
  id SERIAL4 PRIMARY KEY,
  item_id INT4 REFERENCES items(id) ON DELETE CASCADE,
  manuf_id INT4 REFERENCES manufacturers(id) ON DELETE CASCADE,
  quantity INT4
);
