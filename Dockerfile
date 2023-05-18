FROM maven as build
WORKDIR /app
COPY . /app/
RUN mvn install

FROM openjdk:21-jdk-slim-buster
WORKDIR /demo
COPY --from=build /app/target/Uber.jar /demo/
EXPOSE 9091
CMD ["java", "-jar", "Uber.jar"]