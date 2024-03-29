# Start with a base image containing Java runtime (choose the same Java version as your project)
FROM openjdk:21-oracle

# Add Maintainer Info
LABEL maintainer="kontakt@letscode.it"

# Add a volume pointing to /tmp
VOLUME /tmp

# Make port 8080 available to the world outside this container
EXPOSE 8080

# The application's jar file
ARG JAR_FILE=phone-api-0.0.1-SNAPSHOT.jar

# Add the application's jar to the container
ADD ${JAR_FILE} myapp.jar

# Run the jar file
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/myapp.jar"]