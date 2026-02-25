FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /app

# Install Node.js + npm from Ubuntu repos (simple demo)
RUN apt-get update && \
    apt-get install -y nodejs npm && \
    rm -rf /var/lib/apt/lists/*

# Install dependencies
COPY app/package*.json ./
RUN npm ci --omit=dev || npm install --omit=dev

# Copy app source
COPY app/ ./

EXPOSE 8080
CMD ["npm", "start"]
