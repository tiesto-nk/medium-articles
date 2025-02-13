FROM adoptopenjdk/openjdk11:alpine
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
VOLUME /tmp
ARG JAR_FILE
ADD ${JAR_FILE} /app/app.jar
RUN apt-get update
RUN apt-get install -y maven
COPY ./ /usr/local/service
WORKDIR /usr/local/service
EXPOSE 8080
ENTRYPOINT ["java","-jar","target/app.jar"]
