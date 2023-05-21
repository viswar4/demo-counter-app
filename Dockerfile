FROM maven:3.9.2-eclipse-temurin-20-alpine as build
WORKDIR /app
COPY . /app/
RUN mvn dependency:go-offline
RUN mvn clean install

FROM adoptopenjdk/openjdk11:jre-11.0.9_11-alpine
WORKDIR /demo
COPY --from=build /app/target/Uber.jar /demo/
EXPOSE 9099
CMD ["java", "-jar", "Uber.jar"]