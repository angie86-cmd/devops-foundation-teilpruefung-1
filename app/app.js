// Import the built-in HTTP module from Node.js.
// This keeps the example lightweight and avoids external dependencies.
const http = require("http");

// Use the PORT environment variable if available.
// Otherwise, the service runs on port 3000.
const port = process.env.PORT || 3000;

// Create a minimal HTTP server.
// This represents a simple microservice used in the CI/CD pipeline.
const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader("Content-Type", "text/plain");
  res.end("Hello from the DevOps Foundation microservice!\n");
});

// Start the server only when app.js is executed directly.
// This prevents the server from starting during unit tests.
if (require.main === module) {
  server.listen(port, () => {
    console.log(`Microservice running on port ${port}`);
  });
}

// Export the server so it can be imported by the test script.
module.exports = server;