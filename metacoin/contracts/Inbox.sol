// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Inbox {
    function setMessage(string memory _newMessage) public {}
    function getMessage() public view returns (string memory) {}
	function setPageSize(uint _size) public returns (uint) {}
}
