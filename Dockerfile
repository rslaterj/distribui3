FROM openjdk:8-jdk-alpine

# Install wget
RUN apk add --no-cache wget bash

# Download and extract Pig
RUN wget http://apache.mirrors.pair.com/pig/pig-0.17.0/pig-0.17.0.tar.gz \
    && tar -xzvf pig-0.17.0.tar.gz -C /opt \
    && rm pig-0.17.0.tar.gz

# Set environment variables
ENV PIG_HOME /opt/pig-0.17.0
ENV PATH $PIG_HOME/bin:$PATH

# Create a working directory
WORKDIR /pig

# Copy the Pig script into the container
COPY pig-script.pig /pig-script.pig

# Run Pig in local mode
CMD ["pig", "-x", "local", "/pig-script.pig"]
