FROM openjdk:11
EXPOSE 9001
VOLUME /tmp
ARG facility-0.0.1-SNAPSHOT.jar facility-docker.jar
ENTRYPOINT ["java", "-jar", "facility-docker.jar"]
