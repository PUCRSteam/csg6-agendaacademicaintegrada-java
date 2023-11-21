FROM openjdk

COPY . /app

WORKDIR /app

CMD mvn package

COPY --chown=appuser:appuser target/**.jar /app/spring-app.jar

ENTRYPOINT ["java", "-jar","spring-app.jar"] 