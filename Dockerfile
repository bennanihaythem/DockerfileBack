#Step Run Tomcat sql
FROM tomcat:8.0-alpine
ADD . /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh","run"]
#Step build maven
FROM maven:2.8.0-jdk-8-alpine As build
COPY pom.xml /home/app/
COPY src /home/app/src
RUN mvn -f /home/app/pom.xml clean package

#
#Step Run jre
#
FROM openjdk:8-jdk-alpine
COPY --from=build /home/app/target/devops-rest*.jar /usr/local/lib/devops-rest.jar
EXPOSE 8088
USER nobody
ENTRYPOINT [ "java","-jar","./devops-rest.jar" ]



