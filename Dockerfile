FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
CMD mvn package
COPY target/agendaAcademica.jar /app/spring-app.jar
ENTRYPOINT ["java", "-jar","spring-app.jar"] 