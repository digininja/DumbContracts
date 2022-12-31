const Inbox = artifacts.require("Inbox");

module.exports = function(deployer) {
	// The contract name followed by parameters to the
	// constructor.
  deployer.deploy(Inbox, "Message 1");
};
