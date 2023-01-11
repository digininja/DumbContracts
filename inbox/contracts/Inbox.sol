// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Inbox {
    string public message;
    // To set the important message, you have to pay
	// more than the last person paid
	string public importantMessage;
	uint public previousPayment;

 	uint public pageSize;
	address public owner;

    constructor(string memory _initialMessage) {
        message = _initialMessage;
		owner = msg.sender;
		previousPayment = 1;
    }

	function getThisContractBalance() public view returns (uint) {
		require(msg.sender == owner, "Only the owner can get the balance.");
		return(address(this).balance);
	}

 	function resetImportantMessage() public {
		require(msg.sender == owner, "Only the owner can reset the message.");
		previousPayment = 1;
		importantMessage = "";
	}
 
    function setImportantMessage(string memory _newMessage) payable public {
		require(msg.value > previousPayment, "You must pay more than the previous person");
		previousPayment = msg.value;
        importantMessage = _newMessage;
    }
 
    function getImportantMessage() public view returns (string memory) {
        return importantMessage;
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
	
	// payable fallback to receive and store ETH
	fallback() external payable {}

	/*
		For a basic send

		To use it from truffle:
		w = web3.utils.toWei("1","ether")
		inbox.send(w)
	*/

	receive() external payable {}   
}
