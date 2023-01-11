```
truffle(development)> let coin=await MetaCoin.deployed()
undefined
truffle(development)> coin.Existing("0x085e0C76810ddc788628890684C02B5e2a7d8150")
{
  tx: '0x4c371b9ae19a90b7bedd87450a9bb5d499051aa51973393fd31a92f343a4673c',
  receipt: {
    transactionHash: '0x4c371b9ae19a90b7bedd87450a9bb5d499051aa51973393fd31a92f343a4673c',
    transactionIndex: 0,
    blockNumber: 70,
    blockHash: '0x3a524d97f00b98f83b845d1035af6682015da811b772db5b11f69f44b9bd9b59',
    from: '0x8bb6db810989c1ed222be8a409adde5efeedc5a4',
    to: '0x4fddf7a887fae3ce3d39aebe5ae15734b079491f',
    cumulativeGasUsed: 44054,
    gasUsed: 44054,
    contractAddress: null,
    logs: [],
    logsBloom: '0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',
    status: true,
    effectiveGasPrice: 2500102527,
    type: '0x2',
    rawLogs: []
  },
  logs: []
}
truffle(development)> coin.setPageSize()
{ 
  tx: '0x049873a08816f4f0aa370f051780b12f5ffc2e33eb8a110849692be28f4aa2ca',
  receipt: {
    transactionHash: '0x049873a08816f4f0aa370f051780b12f5ffc2e33eb8a110849692be28f4aa2ca',
    transactionIndex: 0,
    blockNumber: 71,
    blockHash: '0xb35634f5e561311a270dfd23c1f9397d385198fbc78c1e5c6a71a61b33a41243',
    from: '0x8bb6db810989c1ed222be8a409adde5efeedc5a4',
    to: '0x4fddf7a887fae3ce3d39aebe5ae15734b079491f',
    cumulativeGasUsed: 29710,
    gasUsed: 29710,
    contractAddress: null,
    logs: [],
    logsBloom: '0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',
    status: true,
    effectiveGasPrice: 2500089749,
    type: '0x2',
    rawLogs: []
  },
  logs: []
}
truffle(development)> coin.setMessage("aaaasssss")
{
  tx: '0x5f76b713b20fcf350aefd22328442696b5710f85293ed92e73f7802944a27c2f',
  receipt: {
    transactionHash: '0x5f76b713b20fcf350aefd22328442696b5710f85293ed92e73f7802944a27c2f',
    transactionIndex: 0,
    blockNumber: 72,
    blockHash: '0xd50355d2201818164a24e3f28d05e9127050de45f0a01e9aa698695bd935ef67',
    from: '0x8bb6db810989c1ed222be8a409adde5efeedc5a4',
    to: '0x4fddf7a887fae3ce3d39aebe5ae15734b079491f',
    cumulativeGasUsed: 31824,
    gasUsed: 31824,
    contractAddress: null,
    logs: [],
    logsBloom: '0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',
    status: true,
    effectiveGasPrice: 2500078553,
    type: '0x2',
    rawLogs: []
  },
  logs: []
}
```

## Sending Ether

Note that the amount of ETH to send has to be a string not an integer.

For this to work, the recipient has to have a receive() function.

```
w = web3.utils.toWei("1","ether")
coin.send(w)
```

To send the same amount of ETH to a payable function, you pass the ETH as the last parameter.

```
coin.sendCashToThisContract({value: w})
```

There are four parameters you can add when sending the ETH. `gas` and `gasPrice` have minimum values set by the EVM.

```
coin.sendCashToThisContract({value: w, from: accounts[1], gasPrice: "140970877", gas: "1000000"})
```


Get the balance of the contract:

```
balance = await web3.eth.getBalance(coin1.address)
```

Get the balance of one of the 10 built in accounts:

```
balance = await web3.eth.getBalance(accounts[0])
```

Assuming the contract was deployed from a different account, this will try to withdraw all the cash from `0xbb1dbcf9F2Eb17F5C8557562d2602C3867c7C0FD`. This will fail with an error as only the owner can do a withdrawl.

```
coin.withdrawAll('0xbb1dbcf9F2Eb17F5C8557562d2602C3867c7C0FD', {from:'0xbb1dbcf9F2Eb17F5C8557562d2602C3867c7C0FD'})
```

This version of the call is insecure and can be called by ayone so will succeed and let the bad account steal all the cash.

```
coin.withdrawAllInsecure('0xbb1dbcf9F2Eb17F5C8557562d2602C3867c7C0FD', {from:'0xbb1dbcf9F2Eb17F5C8557562d2602C3867c7C0FD'})
```

Send ETH into my contract and then bounce it straight back out again to the specified address.

```
coin.sendEthToOtherContract("0x99cB5A1762CD3B68a22a32E1417bFe845A0409Bb", {value:1})
```

Send ETH from the contract's wallet to the other address. This can only be done by the contract owner.

```
coin.sendEthToOtherContractFromMe(accounts[2], 1)
```

This will fail:

```
coin.sendEthToOtherContractFromMe(accounts[2], 1, {from: accounts[2]})
```

This version of the call fails to check the owner and so can ask the wallet to send out its own cash to anyone.

```
coin.sendEthToOtherContractFromMeInsecure(accounts[2], 1, {from: accounts[2]})
```



