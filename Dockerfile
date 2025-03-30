# Use Alpine Linux as the base image
FROM alpine:latest

# Set working directory
WORKDIR /pb

# Copy files into container
COPY pocketbase /pb/pocketbase
COPY pb_data /pb/pb_data

# Set execution permissions
RUN chmod +x /pb/pocketbase

# Expose PocketBase port
EXPOSE 8090

# Run PocketBase server
CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8090"]
