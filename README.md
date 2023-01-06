# DumbContracts

Learning and playing with Ethereum Smart Contracts

## Setup

Make sure to start `ganache` in a background terminal to act as our blockchain.

## Truffle

Make a directory for the code. The project will be a basic inbox.

```bash
mkdir inboxProject
cd inboxProject
truffle init
truffle create contract Inbox
truffle create test Inbox
```

Some notes say to use `truffle unbox` instead.

Compile a project:

```bash
truffle compile
```

Modify the `truffle-config.js` file to point at ganache.

```js
development: {
    host: "127.0.0.1",     // Localhost (default: none)
    port: 8545,            // Standard Ethereum port (default: none)
    network_id: "*",       // Any network (default: none)
}
```

Check the migrations file `migrations/1_deploy.js`

```js
const Inbox = artifacts.require("Inbox");

module.exports = function(deployer) {
  // The contract name followed by parameters to the constructor.
  deployer.deploy(Inbox, "Message 1");
};
```

To get into the truffle console:

```bash
truffle develop
```

Migrate / deploy the contract then do stuff with it:

```
truffle(develop)> migrate

...

Summary
=======
> Total deployments:   1
> Final cost:          0.001666143 ETH

truffle(develop)> let instance = await Inbox.deployed()
undefined
truffle(develop)> let inbox = instance.getMessage()
undefined
truffle(develop)> instance.setMessage("aaa")
{
  tx: '0x47d229d7b827f2d603a181b6b6983dc7d008a53650835ab985789466bee39fb0',
  receipt: {
    transactionHash: '0x47d229d7b827f2d603a181b6b6983dc7d008a53650835ab985789466bee39fb0',
    transactionIndex: 0,
    blockNumber: 2,
    blockHash: '0xfb3c931d5a9733d954f22203178d4ac064c79428a26abe0f5dec845d8767a6a4',
    from: '0xc9cf96433173a4741e706704679aa93e9c605a58',
    to: '0xc1462c4a0efea0c29468729dd00c903018ebb3da',
    cumulativeGasUsed: 28050,
    gasUsed: 28050,
    contractAddress: null,
    logs: [],
    logsBloom: '0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00',
    status: true,
    effectiveGasPrice: 3281690333,
    type: '0x2',
    rawLogs: []
  },
  logs: []
}

truffle(develop)> instance.getMessage()
'aaa'
```

Trying to work out how to access a contract by address from inside truffle. Using require looks promising but can't make it work.

[https://ethereum.stackexchange.com/questions/45305/truffle-develop-get-new-contract-instance-from-contract-address]

[Some useful stuff here][developDeploy]

## Decompile

### Tools

* [Panoramix][panoramix]
* [dedaub][dedaub]
* [ethervm][ethervm]

### Install

Install latest version of NodeJS:

```
curl -sL https://deb.nodesource.com/setup_19.x -o /tmp/nodesource_setup.sh
sudo bash /tmp/nodesource_setup.sh
```

Now install Ganache and Truffle

```
sudo npm install -g ganache truffle
```

Vim Plugin

[vim-solidity][vimsolidity]

### Tutorials

* [REVERSE ENGINEERING A CONTRACT][rev1]

## Useful links

[A good video on setting up VS Code][vscodelink]

[Some example code][byexample]

Three ways to send cash, [this paper][transfer] talks about them and the security problems with them.

[Calling other contracts][calling].

[Video on using encoding methods][videoEncoding].

[Video workshop on decompiling contracts][videoDecompileWorkshop].

[byexample]: https://solidity-by-example.org/sending-ether/
[vscodelink]: https://www.youtube.com/watch?v=tcnpGeOiA_
[transfer]: https://fravoll.github.io/solidity-patterns/secure_ether_transfer.html
[calling]: https://medium.com/@blockchain101/calling-the-function-of-another-contract-in-solidity-f9edfa921f4c
[videoEncoding]: https://www.youtube.com/watch?v=70_2YHJvKIc
[videoDecompileWorkshop]: https://archive.devcon.org/archive/watch/5/the-inner-workings-of-a-smart-contract-decompiler/?tab=YouTube
[panoramix]: https://github.com/palkeo/panoramix
[dedaub]: https://library.dedaub.com/decompile
[ethervm]: https://ethervm.io/decompile
[rev1]: https://ethereum.org/en/developers/tutorials/reverse-engineering-a-contract/
[developDeploy]: https://blog.logrocket.com/truffle-suite-tutorial-develop-ethereum-smart-contracts/
[vimsolidity]: https://github.com/tomlion/vim-solidity
