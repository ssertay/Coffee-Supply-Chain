const HDWalletProvider = require('truffle-hdwallet-provider')

module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*",
    },

    rinkeby: {
      provider: () => new HDWalletProvider("my phrase", 
      `https://rinkeby.infura.io/v3/<endpoint>`),
      
      network_id: 4,
    },
  },

  compilers: {
    solc: {
      version: "0.8.0"
    }
 }
}