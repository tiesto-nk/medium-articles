FROM adoptopenjdk/openjdk11:alpine
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
VOLUME /tmp
RUN apt-get update
RUN apt-get install -y maven
ARG JAR_FILE
ADD ${JAR_FILE} /app/app.jar
COPY ./ /usr/local/service
WORKDIR /usr/local/service
EXPOSE 8080
ENTRYPOINT ["java","-jar","target/app.jar"]
CMD ["java","-jar","target/docker-service-1.0-SNAPSHOT-jar-with-dependencies.jar"]
