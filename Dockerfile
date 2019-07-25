FROM maven:3.6-jdk-8
VOLUME /tmp
COPY liugh-web/target/liugh-web.jar app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Dspring.profiles.active=docker","-jar","/app.jar"]
