# Start with Hugo Docker image
FROM klakegg/hugo:0.93.2-ubuntu

# Configure Image
RUN apt-get -y update && apt-get -y upgrade && \
    apt-get install -y bash curl && \
    curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g firebase-tools

# Configure User permission
RUN useradd -s /bin/bash -m vscode && \
    groupadd docker &&\
    usermod -aG docker vscode && \
    chown -R vscode /tmp/.config

# Configure user
USER vscode

# Hugo dev server port
EXPOSE 1313
