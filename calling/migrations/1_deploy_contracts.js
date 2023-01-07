const Calling = artifacts.require("CallMe");
const MakeCall = artifacts.require("MakeCall");

module.exports = function(deployer) {
  deployer.deploy(MakeCall);
  deployer.deploy(Calling);
};
