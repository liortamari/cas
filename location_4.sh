cqlsh -e "\
  DELETE FROM vehicle.location_by_date \
  WHERE vehicle_id = 'FLN78197' AND date = '2014-05-19' AND time = '2014-05-19 08:20:00';"

cqlsh -e "\
  SELECT * FROM vehicle.location_by_date;"

nodetool flush vehicle location_by_date

ll /var/lib/cassandra/data/vehicle/location_by_date-*

/opt/cassandra/tools/bin/sstabledump /var/lib/cassandra/data/vehicle/location_by_date-*/me-4-big-Data.db

nodetool compact vehicle location_by_date

ll /var/lib/cassandra/data/vehicle/location_by_date-*

/opt/cassandra/tools/bin/sstabledump /var/lib/cassandra/data/vehicle/location_by_date-*/me-5-big-Data.db

