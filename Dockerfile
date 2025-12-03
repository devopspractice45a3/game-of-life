#One stage to build/compile the application
# ---------------------- Stage 1 : Build 
FROM maven:3.6.3-jdk-8 AS build
WORKDIR /app
COPY . .
RUN mvn package

#Another stage to run the application
# ---------------------- Stage 2 : Deploy
FROM donglsheng/tomcat9_jdk8
COPY --from=build /app/gameoflife-web/target/*.war /usr/local/soft/tomcat/webapps/gameoflife.war
EXPOSE 8080
CMD ["/usr/local/soft/tomcat/bin/catalina.sh", "run"]

#Build needs Maven + JDK (heavy)
#Runtime needs only JRE + WAR
#Final image becomes smaller, cleaner, more secure
#Multi-stage build allows you to use multiple FROM instructions in a single Dockerfile.
