FROM openjdk

COPY . /app

WORKDIR /app

CMD mvn package

COPY target/agenda-api-0.0.1-SNAPSHOT.jar /app/spring-app.jar

ENTRYPOINT ["java", "-jar","spring-app.jar"] 