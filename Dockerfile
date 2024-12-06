# Use the official Tomcat image with JDK11
FROM tomcat:9.0.97-jdk17

# Copy the WAR file to Tomcat's webapps directory
COPY target/horoscopo-chino-1.0.0.war /usr/local/tomcat/webapps/

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
