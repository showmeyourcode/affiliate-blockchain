# affiliate-blockchain

NOTE : This smart contract is deployed on [Rinkeby Testnet.](https://rinkeby.etherscan.io/address/0xf772e71a780476ceb2d1f95e0826988d2781da54)

**ABOUT**

- This example takes a use case of Affiliate - Advertiser ecosystem. 
- Smart contract is owned and deployed by the Advertiser.
- Affiliate Registrations, order and payments are controlled by advertiser.
- Affiliates can interact with the smart contract to see there statistics securely.

**USAGE**
- Download and run [Ganache](http://truffleframework.com/ganache/) on local (Local Web3 Provider)
- Go to truffle folder
- Run ``truffle compile``
> This will compile the smart contracts
- Run ``truffle migrate`` 
> This is specific to truffle and not etherium or solidity. This will publish the smart contract to Locally running Web3 Provider
- Run ``truffle console``
- Check ``/test/Test.js``
