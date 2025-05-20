FROM openjdk:17-jdk-slim

WORKDIR /app

# Copy the built jar into the image
COPY build/libs/simple_app_gradle-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 9191

ENTRYPOINT ["java", "-jar", "app.jar"]

#FROM ubuntu:latest
#LABEL authors="Saddam Hossain"
#
#ENTRYPOINT ["top", "-b"]