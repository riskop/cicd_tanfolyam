FROM eclipse-temurin:21.0.1_12-jdk-alpine
WORKDIR /app
COPY target/*.jar employees.jar
CMD [ "java", "-jar", "employees.jar" ]
