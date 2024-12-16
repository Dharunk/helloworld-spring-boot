# Use the official JDK 21 image from Docker Hub
FROM openjdk:21-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the compiled jar file from the target directory into the container
COPY target/helloworld-0.0.1-SNAPSHOT.jar helloworld.jar

# Expose the port on which the app will run
EXPOSE 8080

# Run the jar file
ENTRYPOINT ["java", "-jar", "helloworld.jar"]
