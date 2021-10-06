#Step Run Tomcat sql
FROM tomcat:8.0-alpine
ADD . /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh","run"]
#Step build maven
FROM maven:3.6.1
COPY src /home/app/src
COPY . /home/app/
RUN mvn clean package

#
#Step Run jre
#
FROM openjdk:8-jdk-alpine
LABEL Haythem Bennani <bennani@elhebri.com>
ADD target/*.jar devops-rest.jar
COPY --from=build /home/app/target/*.jar /usr/local/lib/devops-rest.jar
EXPOSE 8088
USER nobody
ENTRYPOINT [ "java","-jar","./devops-rest.jar" ]



