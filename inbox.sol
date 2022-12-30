pragma solidity >= 0.8.17.0;

// SPDX-License-Identifier: GPL-3.0-only

// This is quite basic and might be good for playing with
// when I look at decompilation.

contract Inbox {
    string public message;
 
    constructor(string memory _initialMessage) {
        message = _initialMessage;
    }
 
    function setMessage(string memory _newMessage) public {
        message = _newMessage;
    }
 
    function getMessage() public view returns (string memory) {
        return message;
    }
}