pragma solidity >= 0.8.17.0;

// SPDX-License-Identifier: GPL-3.0-only

// Defines a contract named `HelloWorld`.
contract AverageIt {
    address public sender;
    uint public amount;

    uint256 value;

    constructor (uint256 _p) {
        value = _p;
    }

    // Get the balance
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function startLoop (address payable _to, uint _amount) public payable {
        this.sendCash(_to, _amount);
    }

    // Receive some cash. The sender and amount are stored in variables which
    // are made pulic so they can be read back from outside.
    function receiveCash() external payable {
        sender = msg.sender;
        amount = msg.value;
        // return all bar 1 unit
        if (msg.value < 50) {
            this.sendCash(payable (sender), amount - 1);
        }
    }

    function sendCash(address payable _to, uint _amount) public payable {
        // Call returns a boolean value indicating success or failure.
        // This is the current recommended method to use.
        (bool sent, bytes memory data) = _to.call{value: _amount}("");
        require(sent, "Failed to send Ether");
    }
}