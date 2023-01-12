// SPDX-License-Identifier: MIT
// Tells the Solidity compiler to compile only from v0.8.13 to v0.9.0
pragma solidity ^0.8.13;

import "./ConvertLib.sol";
import "./Inbox.sol";
import "./Calling.sol";

// This is just a simple example of a coin-like contract.
// It is not ERC20 compatible and cannot be expected to talk to other
// coin/token contracts.

contract MetaCoin {
	// The address that deployed this contract
	address public contractOwner;

	// An instance of the inbox
	Inbox anInbox;

	CallMe dc;

	// We pass the address of the contract in here.
	function ExistingCall(address _t) public {
		dc = CallMe(_t);
	}
 
	// We pass the address of the contract in here.
	function Existing(address _t) public {
		anInbox = Inbox(_t);
	}
 
	mapping (address => uint) balances;
	mapping (uint => uint) mappings;

	event Transfer(address indexed _from, address indexed _to, uint256 _value);

	constructor() {
		// Log who deployed (owns) this contract
		contractOwner = msg.sender;

		balances[tx.origin] = 10000;
		mappings[23] = 6;
		mappings[26] = 3;
	}

	function sendCoin(address receiver, uint amount) public returns(bool sufficient) {
		if (balances[msg.sender] < amount) return false;
		balances[msg.sender] -= amount;
		balances[receiver] += amount;
		emit Transfer(msg.sender, receiver, amount);
		return true;
	}

	function getBalanceInEth(address addr) public view returns(uint){
		return ConvertLib.convert(getBalance(addr),2);
	}

	function getBalance(address addr) public view returns(uint) {
		return balances[addr];
	}

	function getArbMapping(uint key) public view returns(uint) {
		// If a key does not exist an empty element is returned.
		// No error is thrown.
		return mappings[key];
	}
	
	function getMessage() public view returns (string memory){
		return anInbox.getMessage();
	}

	function setMessage(string memory _message) public {
		anInbox.setMessage(_message);
	}

	function setPageSize() public returns(uint result) {
		return anInbox.setPageSize(22);
	}

	// Call a() on the dc contract.
	function getA() public view returns (uint result) {
		return dc.a();
	}

	function setA(uint _val) public returns (uint result) {
		dc.setA(_val);
		return _val;
	}

	function sendCashToThisContract() public payable {}

	function getThisContractBalance() public view returns (uint) {
		return(address(this).balance);
	}

	function withdrawAllInsecure(address payable _to) public {
		_to.transfer(address(this).balance);
	}
	function withdrawAll(address payable _to) public {
		require(contractOwner == msg.sender, "Only the owner can authorise a withdrawl");
		_to.transfer(address(this).balance);
	}

	// Allow the owner to specify sending cash out of the contract
	// to someone else
	function sendEthToOtherContractFromMe(address payable _to, uint _value) public {
		require(contractOwner == msg.sender, "Only the owner can authorise sending out cash from the wallet");
		(bool sent, ) = _to.call{value: _value}("");
		require(sent, "Failed to send Ether");
	}

	// This is vulnerable as anyone can call it and ask it to send
	// cash out from the contract's wallet to the _to address.
	function sendEthToOtherContractFromMeInsecure(address payable _to, uint _value) public {
		(bool sent, ) = _to.call{value: _value}("");
		require(sent, "Failed to send Ether");
	}

	// This takes cash in and sends it straight back out again
	// to the specified contract. No vulnerability, but it slightly
	// obscures where the cash is coming from as it uses this contract
	// as a proxy to the other contract.
	function sendEthToOtherContract(address payable _to) public payable {
		// Call returns a boolean value indicating success or failure.
		(bool sent, bytes memory data) = _to.call{value: msg.value}("");
		require(sent, "Failed to send Ether");
	}

	// Same as above, but also takes a commission for doing the proxy
	function sendEthProxyComission (address payable _to) public payable {
		uint valueToSend;

		// We have to make a profit so if they only send 1
		// tough luck, we keep it.
		if (msg.value == 1) {
			valueToSend = 0;
		// Take 10 if sending over 100
		} else if (msg.value > 100) {
			valueToSend = msg.value - 10;
		// Take 5 if over 50
		} else if (msg.value > 50) {
			valueToSend = msg.value - 5;
		} else {
			valueToSend = msg.value - 1;
		}

		if (valueToSend > 0) {
			(bool sent, bytes memory data) = _to.call{value: valueToSend}("");
			require(sent, "Failed to send Ether");
		}
	}

	// This function is called for all messages sent to
	// this contract (there is no other function).
	// This next bit is comment from example, not sure what it means...
	// Sending Ether to this contract will cause an exception,
	// because the fallback function does not have the `payable`
	// modifier.
	fallback() external payable {}
	
	// This function is called for plain Ether transfers, i.e.
	// for every call with empty calldata.
	// Example:
	// w = web3.utils.toWei("1","ether")
	// coin.send(w)

	receive() external payable {}
}
