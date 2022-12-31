// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

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
