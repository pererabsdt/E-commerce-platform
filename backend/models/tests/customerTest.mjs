import Customer from "../Customer"; // Adjust the path if necessary

// Load environment variables from .env file

(async () => {
  try {
    const customer = await Customer.findByUsername("Parakrama");
    console.log("Customer:", customer);
  } catch (error) {
    console.error("Error during test:", error);
  }
})();
