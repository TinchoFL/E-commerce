FROM maven:3.8.3-openjdk-17-slim AS dependencies
WORKDIR /home/app
COPY pom.xml pom.xml
RUN mvn dependency:resolve dependency:resolve-plugins

FROM dependencies AS build
COPY . .
RUN mvn package -DskipTests

FROM eclipse-temurin:17-jre AS deploy
WORKDIR /home/app

# Copiamos el jar generado
COPY --from=build /home/app/target/product-example-0.0.1-SNAPSHOT.jar /home/app/product-example-0.0.1-SNAPSHOT.jar



EXPOSE 8080

# Usamos entrypoint.sh para esperar a la DB antes de lanzar Spring Boot
# Copiamos los scripts
COPY wait-for-it.sh entrypoint.sh ./
RUN chmod +x wait-for-it.sh entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
