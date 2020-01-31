const myCoin = artifacts.require("myCoin");

module.exports = function(deployer) {
  deployer.deploy(myCoin);
};
