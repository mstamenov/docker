# Start with the official Jenkins image
FROM jenkins/jenkins:lts

# Switch to the root user to install additional software
USER root

# Install dependencies and the .NET SDK
RUN apt-get update && apt-get install -y \
    wget \
    apt-transport-https \
    software-properties-common && \
    wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    apt-get update && \
    apt-get install -y dotnet-sdk-8.0 && \
    rm -rf /var/lib/apt/lists/*

RUN export PATH=$PATH:/usr/bin

# Ensure the global tools are accessible for the Jenkins user
ENV PATH="/var/jenkins_home/.dotnet/tools:${PATH}"

# Switch back to the Jenkins user
USER jenkins

# Install SonarQube Scanner for .NET globally
RUN dotnet tool install --global dotnet-sonarscanner
