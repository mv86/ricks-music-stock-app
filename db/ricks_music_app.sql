DROP TABLE stock;
DROP TABLE genres;
DROP TABLE albums;
DROP TABLE artists;


CREATE TABLE artists (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  genre VARCHAR(255)
);

CREATE TABLE albums (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  year INT4,
  genre VARCHAR(255),
  artist_id INT4 REFERENCES artists(id) ON DELETE CASCADE
);

CREATE TABLE stock (
  id SERIAL4 PRIMARY KEY,
  quantity INT4,
  buy_price DECIMAL(4, 2),
  sell_price DECIMAL(4, 2),
  album_id INT4 REFERENCES albums(id) ON DELETE CASCADE
);

CREATE TABLE genres (
  id SERIAL4 PRIMARY KEY,
  genre VARCHAR(255)
);