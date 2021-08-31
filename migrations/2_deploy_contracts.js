const energy_management = artifacts.require("./energy_management.sol");

module.exports = function(deployer) {
  deployer.deploy(energy_management);
};

