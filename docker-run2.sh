docker container rm /maven-demo2
docker run -m 512MB -p 8383:8383 -p 127.0.0.1:9393:9393 --env SERVER_PORT=8383 --env JMX_PORT=9393 --name maven-demo2 maven-demo