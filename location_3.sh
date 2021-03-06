cqlsh -e "\
  UPDATE vehicle.location_by_date \
  SET latitude = 0 \
  WHERE vehicle_id = 'LAKRM489' AND date = '2014-05-20' AND time = '2014-05-20 08:00:00';"

cqlsh -e "\
  SELECT * FROM vehicle.location_by_date;"

nodetool flush vehicle location_by_date

ll /var/lib/cassandra/data/vehicle/location_by_date-*

/opt/cassandra/tools/bin/sstabledump /var/lib/cassandra/data/vehicle/location_by_date-*/me-2-big-Data.db

nodetool compact vehicle location_by_date

ll /var/lib/cassandra/data/vehicle/location_by_date-*

/opt/cassandra/tools/bin/sstabledump /var/lib/cassandra/data/vehicle/location_by_date-*/me-3-big-Data.db
