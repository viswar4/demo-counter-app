FROM eclipse-temurin
WORKDIR /demo
COPY target/Uber.jar /demo/
EXPOSE 9099
CMD ["java", "-jar", "Uber.jar"]
