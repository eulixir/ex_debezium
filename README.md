# ex_debezium

```sql
alter table users replica identity full;
```

```bash
curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" 127.0.0.1:8083/connectors/ --data "@debezium.json"

docker run --tty --network ex-debezium_default confluentinc/cp-kafkacat kafkacat -b kafka:9092 -C -s key=s -s value=avro -r http:/schema-registry:8081 -t postgres.public.users
```
