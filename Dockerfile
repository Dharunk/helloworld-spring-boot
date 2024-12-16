# # Use the official JDK 21 image from Docker Hub
# FROM openjdk:21-jdk-slim

# # Set the working directory in the container
# WORKDIR /app

# # Copy the compiled jar file from the target directory into the container
# COPY target/helloworld-0.0.1-SNAPSHOT.jar helloworld.jar

# # Expose the port on which the app will run
# EXPOSE 8080

# # Run the jar file
# ENTRYPOINT ["java", "-jar", "helloworld.jar"]

# Use an OpenJDK 21 base image
FROM openjdk:21-jdk-slim as builder

# Set the working directory
WORKDIR /app

# Copy the Maven wrapper files and the source code
COPY .mvn/ .mvn/
COPY mvnw mvnw
COPY pom.xml .
COPY src ./src

# Make the mvnw script executable
RUN chmod +x mvnw

# Run Maven to build the application
RUN ./mvnw clean package -DskipTests

# Create a final image for running the application
FROM openjdk:21-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the JAR file from the builder image
COPY --from=builder /app/target/helloworld-0.0.1-SNAPSHOT.jar app.jar

# Expose the application port
EXPOSE 8080

# Run the JAR file
ENTRYPOINT ["java", "-jar", "app.jar"]
