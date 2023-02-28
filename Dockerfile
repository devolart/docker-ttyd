FROM ubuntu:latest

# Update package lists and install necessary packages
RUN apt-get update && \
    apt-get install -y curl git wget nano unzip net-tools gnupg2 ca-certificates

# Install Node.js and npm
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

# Install Python
RUN apt-get install -y python3 python3-pip

# Install ttyd
RUN wget https://github.com/tsl0922/ttyd/releases/download/1.7.3/ttyd.x86_64 -O /usr/local/bin/ttyd
RUN chmod +x /usr/local/bin/ttyd

# Expose port 8080
EXPOSE 8080

# Start ttyd on container startup
ENTRYPOINT ["ttyd", "-p", "8080", "bash"]
