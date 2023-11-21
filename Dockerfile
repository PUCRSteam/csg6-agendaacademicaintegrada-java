# FROM openjdk

# # COPY . /app

# WORKDIR /app

# CMD mvn package

# COPY  target/agendaAcademica.jar /app/spring-app.jar

# ENTRYPOINT ["java", "-jar","spring-app.jar"] 

FROM eclipse-temurin:17-jdk-alpine
VOLUME /tmp
ARG JAR_FILE
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]