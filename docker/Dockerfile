# Estágio 1: Build da aplicação com Maven
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn clean package -DskipTests

# Estágio 2: Imagem final com Distroless
# Usa uma imagem base mínima do Google (Distroless) que contém apenas o Java e suas dependências.
# É uma imagem segura e otimizada, representando um bom equilíbrio entre tamanho e estabilidade.
FROM gcr.io/distroless/java17-debian12
WORKDIR /app
EXPOSE 8080
COPY --from=build /app/target/padnt-*.jar ./padnt.jar
ENTRYPOINT ["java", "-jar", "padnt.jar"]
