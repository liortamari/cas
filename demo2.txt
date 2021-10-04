cqlsh -e "\
  CREATE TABLE music.songs_by_artist (\
  song_name text, \
  artist text, \
  PRIMARY KEY (artist, song_name));"

cqlsh -e "\
  INSERT INTO music.songs_by_artist (song_name, artist) \
  VALUES ('Song1', 'Alice');"

cqlsh -e "\
  INSERT INTO music.songs_by_artist (song_name, artist) \
  VALUES ('Song1', 'Bob');"

cqlsh -e "\
  INSERT INTO music.songs_by_artist (song_name, artist) \
  VALUES ('Song2', 'Alice');"

cqlsh -e "\
  SELECT * FROM music.songs_by_artist;"

cqlsh -e "\
  SELECT * FROM music.songs_by_artist \
  WHERE artist = 'Alice';"
