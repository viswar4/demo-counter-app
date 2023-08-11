FROM eclipse-temurin
WORKDIR /demo
COPY Uber.jar /demo/
EXPOSE 9099
CMD ["java", "-jar", "Uber.jar"]
