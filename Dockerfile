FROM node:18 AS front
WORKDIR /fe
COPY Front-End-React-Client/Coodle/ .
RUN npm install && CI=false npm run build

FROM maven:3.8.8-eclipse-temurin-11 AS back
WORKDIR /be
COPY Back-End-SpringBoot-Server/Coodle/ .
COPY --from=front /fe/build ./src/main/resources/static
RUN mvn -q package -DskipTests

FROM eclipse-temurin:11-jre
RUN apt-get update && apt-get install -y mariadb-server && rm -rf /var/lib/apt/lists/*
COPY --from=back /be/target/Coodle.war /app/app.war
COPY start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]