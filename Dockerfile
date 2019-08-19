FROM openjdk:8-jre-alpine

VOLUME ["/tmp"]
ADD /target/maven-demo-1.0.0-4-SNAPSHOT.jar app.jar
RUN sh -c 'touch /app.jar'

ENV GC "-XX:+CMSClassUnloadingEnabled -XX:+UseConcMarkSweepGC -XX:+CMSParallelRemarkEnabled -XX:+UseCMSInitiatingOccupancyOnly -XX:CMSInitiatingOccupancyFraction=70 -XX:+ScavengeBeforeFullGC -XX:+CMSScavengeBeforeRemark -XX:+ExplicitGCInvokesConcurrentAndUnloadsClasses -Xss512k -XX:+PrintGCDetails -XX:+PrintGCTimeStamps"
ENV JAVA_MEM "-XX:MaxMetaspaceSize=100m -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -XX:MaxRAMPercentage=90.0 -XX:MinRAMPercentage=90.0 -XX:InitialRAMPercentage=90.0"
ENV SERVER_PORT "8282"

ENTRYPOINT ["sh", "-c", "java -server -Djava.security.egd=file:/dev/./urandom $JAVA_MEM $GC -Dserver.port=$SERVER_PORT -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=$JMX_PORT -Dcom.sun.management.jmxremote.rmi.port=$JMX_PORT -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.local.only=false -Djava.rmi.server.hostname=127.0.0.1 -jar /app.jar"]