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

## Decompile

### Tools

* [Panoramix][panoramix]
* [dedaub][dedaub]
* [ethervm][ethervm]

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