FROM maven:alpine as build
WORKDIR /app
COPY . /app/
RUN mvn install

FROM openjdk:8-jdk-alpine
WORKDIR /app/
COPY --from=build /app/target/Uber.jar /app/
EXPOSE 9091
CMD ["java", "-jar", "Uber.jar"]