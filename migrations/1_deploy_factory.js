const UniswapV2Factory = artifacts.require("UniswapV2Factory");

module.exports = function(deployer, network, accounts) {
  return deployer.then(() => {
    return deployer.deploy(UniswapV2Factory, '0x9F4a04eF5dBEEDC84CC89E826C5B0A36EB3E7195');
  }).then(() => {
  }).then(async () => {
  })
};
