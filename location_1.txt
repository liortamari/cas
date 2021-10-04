cqlsh -e "CREATE KEYSPACE vehicle WITH replication = {'class': 'SimpleStrategy', 'replication_factor' : 1};"

cqlsh -e "CREATE TABLE vehicle.location_by_vehicle (\
  vehicle_id text, \
  time timestamp, \
  latitude double, \
  longitude double, \
  PRIMARY KEY (vehicle_id, time));"

cqlsh -e "COPY vehicle.location_by_vehicle (vehicle_id, time, latitude, longitude) FROM '/location_1.csv' WITH header = true AND delimiter = '|';"

cqlsh -e "\
  SELECT * FROM vehicle.location_by_vehicle;"

cqlsh -e "CREATE TABLE vehicle.location_by_time (\
  vehicle_id text, \
  time timestamp, \
  latitude double, \
  longitude double, \
  PRIMARY KEY (time, vehicle_id));"

cqlsh -e "COPY vehicle.location_by_time (vehicle_id, time, latitude, longitude) FROM '/location_1.csv' WITH header = true AND delimiter = '|';"

cqlsh -e "\
  SELECT * FROM vehicle.location_by_time;"
