
FROM maven:3.9.9-openjdk-17-slim AS build

WORKDIR /app

COPY pom.xml /app
RUN mvn dependency:go-offline

COPY src /app/src

RUN mvn clean package

FROM openjdk:11-jre-slim

WORKDIR /app

COPY --from=build /app/target/TesteDeIntegracao-1.0-SNAPSHOT.jar /app/TesteDeIntegracao.jar

CMD ["java", "-jar", "/app/TesteDeIntegracao.jar"]
