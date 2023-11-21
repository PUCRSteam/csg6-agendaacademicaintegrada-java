# FROM openjdk

# # COPY . /app

# WORKDIR /app

# CMD mvn package

# COPY  target/agendaAcademica.jar /app/spring-app.jar

# ENTRYPOINT ["java", "-jar","spring-app.jar"] 

FROM eclipse-temurin:17-jdk-alpine
VOLUME /tmp
VOLUME /tmp
COPY target/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]