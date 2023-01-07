// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Inbox {
    string public message;
 	uint public pageSize;

    constructor(string memory _initialMessage) {
        message = _initialMessage;
    }
 
    function setMessage(string memory _newMessage) public {
        message = _newMessage;
    }
 
    function getMessage() public view returns (string memory) {
        return message;
    }

	function setPageSize(uint _size) public returns (uint) {
		pageSize = _size;
		return pageSize;
	}
}
