// Post-generation setup script
// Trust mise configuration and install dependencies

// Trust the mise configuration
system::command("mise", ["trust"]);

// Install mise dependencies
system::command("mise", ["install"]);
