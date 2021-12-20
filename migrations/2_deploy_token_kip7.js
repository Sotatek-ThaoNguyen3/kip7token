const MyToken = artifacts.require("KIP7Token");

module.exports = async function (deployer, network, accounts) {
  // Deploy MyToken
  await deployer.deploy(
    MyToken,
    "KLAYTN KIP7 Token Sotatek",
    "KIP7SOTA",
    18
  );
  const myToken = await MyToken.deployed();
};
