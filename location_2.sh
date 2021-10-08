cqlsh -e "CREATE TABLE vehicle.location_by_date (\
  vehicle_id text, \
  date text, \
  time timestamp, \
  latitude double, \
  longitude double, \
  PRIMARY KEY ((vehicle_id, date), time));"

cqlsh -e "COPY vehicle.location_by_date (vehicle_id, date, time, latitude, longitude) FROM '/location_2.csv' WITH header = true AND delimiter = '|';"

cqlsh -e "\
  SELECT * FROM vehicle.location_by_date;"


nodetool flush vehicle location_by_date

ll /var/lib/cassandra/data/vehicle/

/opt/cassandra/tools/bin/sstabledump /var/lib/cassandra/data/vehicle/location_by_date-*/me-1-big-Data.db

ll /var/lib/cassandra/data/vehicle/location_by_date-*

nodetool tablehistograms vehicle location_by_date