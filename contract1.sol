pragma solidity >= 0.8.17.0;

// SPDX-License-Identifier: GPL-3.0-only

// Defines a contract named `HelloWorld`.
contract HelloWorld {
    // Stored on the chain and publicly accessible to anyone who cares to look
    string public message;

    // Stored on the chain but not accessible outside the contract
    string private secret;

    // initialise the message to something
    constructor(string memory initMessage) {
        message = initMessage;
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
