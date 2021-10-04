cqlsh -e "\
  CREATE KEYSPACE music WITH replication = {'class': 'SimpleStrategy', 'replication_factor' : 1};"

cqlsh -e "\
  CREATE TABLE music.songs (\
  song_id int, \
  song_name text, \
  artist text, \
  PRIMARY KEY (song_id));"

cqlsh -e "\
  INSERT INTO music.songs (song_id, song_name, artist) \
  VALUES (1, 'Song1', 'Alice');"

cqlsh -e "\
  INSERT INTO music.songs (song_id, song_name, artist) \
  VALUES (2, 'Song1', 'Bob');"

cqlsh -e "\
  INSERT INTO music.songs (song_id, song_name, artist) \
  VALUES (3, 'Song2', 'Alice');"

cqlsh -e "\
  SELECT * FROM music.songs;"

cqlsh -e "\
  SELECT * FROM music.songs \
  WHERE song_id = 3;"

cqlsh -e "\
  SELECT * FROM music.songs \
  WHERE artist = 'Alice';"
