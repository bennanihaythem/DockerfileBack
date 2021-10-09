#Step 1 install maven and create 
FROM maven:latest as build 
WORKDIR /src/app
COPY . /src/app/pom.xml
CMD mvn install
CMD run build 

#Step2 install java and deployment JDk8

FROM openjdk:8
COPY --from=build /src/app/target/devops-rest*.jar devops-rest.jar
EXPOSE 8089
ENTRYPOINT["java","-jar","devops-rest.jar"]
