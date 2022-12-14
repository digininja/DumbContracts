pragma solidity >= 0.8.17.0;

// SPDX-License-Identifier: GPL-3.0-only

// Defines a contract named `HelloWorld`.
contract HelloWorld {
    // Stored on the chain and publicly accessible to anyone who cares to look
    string public message;

    // Stored on the chain but not accessible outside the contract
    string private secret;
    address public sender;
    uint public amount;

    // initialise the message to something
    constructor(string memory initMessage) {
        message = initMessage;
    }

    // Get the balance
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    // Receive some cash. The sender and amount are stored in variables which
    // are made pulic so they can be read back from outside.
    function receiveCash() external payable {
        sender = msg.sender;
        amount = msg.value;
    }

    // Based on this site, this is the best way to send ether
    // https://solidity-by-example.org/sending-ether/
    function sendViaCall(address payable _to) public payable {
        // Call returns a boolean value indicating success or failure.
        // This is the current recommended method to use.
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }

    // A public function that puts the new message onto the chain
    function update(string memory newMessage) public {
        message = newMessage;
        secret = string.concat(newMessage, "secret");
    }

    // This is private so can't be seen from outside the contract or anything derived
    // from this contract.
    function privateGetSecret() private view returns (string memory) {
        return secret;
    }

    function canICallExternal() private view {
        string memory localSecret = internalGetSecret();
        // External functions need this. to call them
        // still not completely sure when they are useful but 
        // things keep talking about when working with large arrays of data.
        localSecret = this.externalGetSecret();
    }

    // Can't be seen inside the contract but can be seen by anything that imports this.
    // Not really sure the point of this.
    function externalGetSecret() external view returns (string memory) {
        return secret;
    }

    // Can be called by other internal functions and anything derived from this
    function internalGetSecret() internal view returns (string memory) {
        return secret;
    }
}
