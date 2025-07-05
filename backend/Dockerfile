# Etapa de dependencias
FROM maven:3.8.3-openjdk-17-slim AS dependencies
WORKDIR /home/app
COPY backend/pom.xml pom.xml
RUN mvn dependency:resolve dependency:resolve-plugins

# Etapa de construcción
FROM dependencies AS build
COPY backend/src src
RUN mvn package -DskipTests

# Etapa de despliegue
FROM eclipse-temurin:17-jre AS deploy
WORKDIR /home/app

# Copiamos el jar generado
COPY --from=build /home/app/target/product-example-0.0.1-SNAPSHOT.jar /home/app/product-example-0.0.1-SNAPSHOT.jar

EXPOSE 8080

# Copiamos los scripts necesarios
COPY backend/wait-for-it.sh backend/entrypoint.sh ./
RUN chmod +x wait-for-it.sh entrypoint.sh

# Usamos entrypoint.sh para esperar a la DB antes de lanzar Spring Boot
ENTRYPOINT ["./entrypoint.sh"]