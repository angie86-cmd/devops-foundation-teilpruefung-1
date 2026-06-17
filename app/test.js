// Import the server module from the application.
// This simple test verifies that the microservice can be loaded successfully.
const server = require("./app");

// If the server object is missing, the test fails.
if (!server) {
  throw new Error("Microservice module could not be loaded.");
}

// If the module is loaded, the test passes.
console.log("Unit test passed: microservice module loaded successfully.");