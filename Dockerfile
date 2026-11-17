FROM eclipse-temurin:25
EXPOSE 25565

WORKDIR /server

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
RUN curl -X GET "https://piston-data.mojang.com/v1/objects/33680f5f2ac32864d6d7cf5e56a705fdb3e05f4c/server.jar" --output ./server.jar
RUN echo 'eula=true' > ./eula.txt
RUN echo 'white-list=false' > ./server.properties


CMD ["java", "-jar", "server.jar"]