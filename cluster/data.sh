cqlsh -e "\
  CREATE KEYSPACE music WITH replication = {'class': 'SimpleStrategy', 'replication_factor' : 3};"

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

cqlsh -e "\
  DROP KEYSPACE lior;"

cqlsh -e "\
  CREATE KEYSPACE lior WITH replication = {'class': 'SimpleStrategy', 'replication_factor' : 3};"

cqlsh -e "\
  CREATE TABLE IF NOT EXISTS lior.test (
      campaign_id INT,
      user_id TEXT,
      event_type TEXT,
      element_id TEXT,
      created TIMESTAMP,
      PRIMARY KEY ((campaign_id, event_type), element_id, user_id, created));"

cqlsh -e "\
  INSERT INTO lior.test (campaign_id, user_id, event_type, element_id, created) \
  VALUES (1, 'user1', 'open', '', toTimestamp(now()));"

cqlsh -e "\
  INSERT INTO lior.test (campaign_id, user_id, event_type, element_id, created) \
  VALUES (1, 'user1', 'click', 'instagram', toTimestamp(now()));"

cqlsh -e "\
  INSERT INTO lior.test (campaign_id, user_id, event_type, element_id, created) \
  VALUES (1, 'user1', 'click', 'url', 0);"

cqlsh -e "\
  INSERT INTO lior.test (campaign_id, user_id, event_type, element_id, created) \
  VALUES (2, 'user2', 'open', '', toTimestamp(now()));"

cqlsh -e "\
  INSERT INTO lior.test (campaign_id, user_id, event_type, element_id, created) \
  VALUES (2, 'user2', 'click', 'instagram', toTimestamp(now()));"

cqlsh -e "\
  INSERT INTO lior.test (campaign_id, user_id, event_type, element_id, created) \
  VALUES (2, 'user2', 'click', 'url', 0);"

cqlsh -e "\
  INSERT INTO lior.test (campaign_id, user_id, event_type, element_id, created) \
  VALUES (2, 'user3', 'open', '', toTimestamp(now()));"

cqlsh -e "\
  INSERT INTO lior.test (campaign_id, user_id, event_type, element_id, created) \
  VALUES (2, 'user3', 'click', 'instagram', toTimestamp(now()));"

cqlsh -e "\
  INSERT INTO lior.test (campaign_id, user_id, event_type, element_id, created) \
  VALUES (2, 'user3', 'click', 'url', 0);"

cqlsh -e "\
  INSERT INTO lior.test (campaign_id, user_id, event_type, element_id, created) \
  VALUES (2, 'user3', 'click', 'tiktok', toTimestamp(now()));"

cqlsh -e "\
  INSERT INTO lior.test (campaign_id, user_id, event_type, element_id, created) \
  VALUES (2, 'user3', 'click', 'url', 0);"

cqlsh -e "\
  SELECT * FROM lior.test;"

cqlsh -e "\
  SELECT campaign_id, COUNT(user_id) FROM lior.test WHERE campaign_id IN (1, 2) AND event_type = 'open' GROUP BY campaign_id, event_type;"

cqlsh -e "\
  SELECT campaign_id, COUNT(user_id) FROM lior.test WHERE campaign_id IN (1, 2) AND event_type = 'click' and element_id = 'url' GROUP BY campaign_id, event_type;"

cqlsh -e "\
  SELECT count(user_id) from lior.test WHERE campaign_id = 1 and event_type = 'click' and element_id = 'instagram';"

cqlsh -e "\
  SELECT count(user_id) from lior.test WHERE campaign_id = 2 and event_type = 'click' and element_id = 'instagram';"

cqlsh -e "\
  SELECT count(user_id) from lior.test WHERE campaign_id = 1 and event_type = 'click' and element_id = 'tiktok';"

cqlsh -e "\
  SELECT count(user_id) from lior.test WHERE campaign_id = 2 and event_type = 'click' and element_id = 'tiktok';"

cqlsh -e "CREATE KEYSPACE vehicle WITH replication = {'class': 'SimpleStrategy', 'replication_factor' : 3};"

cqlsh -e "CREATE TABLE vehicle.location_by_vehicle (\
  vehicle_id text, \
  time timestamp, \
  latitude double, \
  longitude double, \
  PRIMARY KEY (vehicle_id, time));"

cqlsh -e "COPY vehicle.location_by_vehicle (vehicle_id, time, latitude, longitude) FROM './location_1.csv' WITH header = true AND delimiter = '|';"

cqlsh -e "\
  SELECT * FROM vehicle.location_by_vehicle;"

cqlsh -e "CREATE TABLE vehicle.location_by_time (\
  vehicle_id text, \
  time timestamp, \
  latitude double, \
  longitude double, \
  PRIMARY KEY (time, vehicle_id));"

cqlsh -e "COPY vehicle.location_by_time (vehicle_id, time, latitude, longitude) FROM './location_1.csv' WITH header = true AND delimiter = '|';"

cqlsh -e "\
  SELECT * FROM vehicle.location_by_time;"

cqlsh -e "CREATE TABLE vehicle.location_by_date (\
  vehicle_id text, \
  date text, \
  time timestamp, \
  latitude double, \
  longitude double, \
  PRIMARY KEY ((vehicle_id, date), time));"

cqlsh -e "COPY vehicle.location_by_date (vehicle_id, date, time, latitude, longitude) FROM './location_2.csv' WITH header = true AND delimiter = '|';"

cqlsh -e "\
  SELECT * FROM vehicle.location_by_date;"

cqlsh -e "\
  UPDATE vehicle.location_by_date \
  SET latitude = 0 \
  WHERE vehicle_id = 'LAKRM489' AND date = '2014-05-20' AND time = '2014-05-20 08:00:00';"

cqlsh -e "\
  SELECT * FROM vehicle.location_by_date;"

cqlsh -e "\
  DELETE FROM vehicle.location_by_date \
  WHERE vehicle_id = 'FLN78197' AND date = '2014-05-19' AND time = '2014-05-19 08:20:00';"

cqlsh -e "\
  SELECT * FROM vehicle.location_by_date;"

