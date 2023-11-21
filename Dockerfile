FROM openjdk
VOLUME /tmp
ARG JAR_FILE
COPY ${JAR_FILE} app.jar