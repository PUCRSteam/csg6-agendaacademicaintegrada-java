FROM openjdk

COPY target/agendaAcademica.jar app.jar

# test
EXPOSE 3000

ENTRYPOINT ["java","-jar","/app.jar"]