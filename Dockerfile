# Use uma imagem base do Maven para construir o projeto
FROM maven:3.9.9-openjdk-17-slim AS build

# Defina o diretório de trabalho
WORKDIR /app

# Copie o arquivo pom.xml e baixe as dependências do Maven
COPY pom.xml /app
RUN mvn dependency:go-offline

# Copie o código-fonte do projeto
COPY src /app/src

# Construa o projeto
RUN mvn clean package

# Use uma imagem base do OpenJDK para executar a aplicação
FROM openjdk:11-jre-slim

# Defina o diretório de trabalho
WORKDIR /app

# Copie o arquivo JAR gerado na etapa de build
COPY --from=build /app/target/TesteDeIntegracao-1.0-SNAPSHOT.jar /app/TesteDeIntegracao.jar

# Defina o comando de execução
CMD ["java", "-jar", "/app/TesteDeIntegracao.jar"]
