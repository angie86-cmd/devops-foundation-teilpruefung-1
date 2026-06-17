# Use a lightweight Node.js image based on Alpine Linux.
# This keeps the container small and suitable for microservice deployments.
FROM node:22-alpine

# Define the working directory inside the container.
WORKDIR /app

# Copy package metadata first.
# This allows Docker to cache dependency installation separately.
COPY package.json ./

# Install project dependencies.
# This example has no external dependencies, but the step represents a real Node.js workflow.
RUN npm install

# Copy application and test files into the image.
COPY app.js ./
COPY test.js ./

# Document the internal application port.
EXPOSE 3000

# Start the microservice when the container runs.
CMD ["npm", "start"]