# Use Alpine Linux as the base image
FROM alpine:latest

# Set working directory
WORKDIR /pb

# Download latest PocketBase release inside the container
RUN wget -O pocketbase.zip https://github.com/pocketbase/pocketbase/releases/latest/download/pocketbase-linux-amd64.zip \
    && unzip pocketbase.zip && rm pocketbase.zip \
    && chmod +x pocketbase

# Expose PocketBase port
EXPOSE 8090

# Run PocketBase server
CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8090"]
