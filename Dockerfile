#Step 1 install maven and create 
FROM maven:latest as build 
WORKDIR /src/app
COPY . /src/app/pom.xml
RUN mvn install


#Step2 install java and deployment JDk8

FROM openjdk:8
COPY --from=build /src/app/target/devops-devops*.jar devops-devops.jar
EXPOSE 8089
ENTRYPOINT["java","-jar","devops-devops.jar"]
