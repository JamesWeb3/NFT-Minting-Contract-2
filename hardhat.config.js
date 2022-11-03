require("@nomicfoundation/hardhat-toolbox");
const dotenv = require("dotenv");

require('dotenv').config({path:__dirname+'/.env'})

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  defaultNetwork: "goerli",
  networks: {
    hardhat: {
      chainId:1337
    },
    goerli: {
      url: process.env.REACT_APP_GOERLI_URL
      accounts: [process.env.REACT_APP_PRIVATE_KEY],
    }
  },
  etherscan: {
    apiKey: process.env.REACT_APP_ETHERSCAN_KEY
  }
}
    
  
