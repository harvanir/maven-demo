docker container rm /maven-demo1
docker run -m 512MB -p 8282:8282 -p 127.0.0.1:9292:9292 --env SERVER_PORT=8282 --env JMX_PORT=9292 --name maven-demo1 maven-demo