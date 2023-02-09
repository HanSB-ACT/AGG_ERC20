var token = artifacts.require("AGGToken");

module.exports = function (deployer) {
  require("dotenv").config();
  const name = process.env.NAME;
  const symbol = process.env.SYMBOL;
  const decimals = process.env.DECIMALS;
  const initSupply = process.env.INITIAL_SUPPLY;
  deployer.deploy(token, name, symbol, decimals, initSupply);
};
