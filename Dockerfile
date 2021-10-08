#Step Run Tomcat sql
#FROM tomcat:8.0-alpine
#ADD . /usr/local/tomcat/webapps/
#EXPOSE 8080
#CMD ["catalina.sh","run"]

#################################
#Step build maven
#FROM maven:3.6.1 As build
#COPY pom.xml /home/app/
#COPY src /home/app/src
#RUN mvn -f /home/app/pom.xml clean
#RUN mvn -f /home/app/pom.xml clean test
#RUN mvn -f /home/app/pom.xml compile
#RUN mvn -f /home/app/pom.xml install
#RUN mvn -f /home/app/pom.xml clean package
#RUN mvn -f /home/app/pom.xml clean build

#
#Step Run jre
#
FROM openjdk:8-jdk-alpine
#WORKDIR /target
#COPY from=build /home/app/target/ /home/app/target/
ADD target/devops-rest*.jar devops-rest.jar
EXPOSE 8089
#USER nobody
ENTRYPOINT [ "java","-jar","devops-rest.jar" ]



