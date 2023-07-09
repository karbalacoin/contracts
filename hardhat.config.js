require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.18",
  networks: {
    bsctestnet: {
        url: 'https://bsc-testnet.publicnode.com',
        accounts: [process.env["TEST_ACCOUNT_PRIVATE_KEY"]],
    },
    bsc: {
        url: 'https://bsc.publicnode.com',
        accounts: [process.env["TEST_ACCOUNT_PRIVATE_KEY"]],
    },
  },
  etherscan: {
    apiKey: {
      bsc: process.env.BSC_SCAN_API_KEY
    }
  }
};
