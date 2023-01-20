pragma solidity >= 0.8.17.0;

// SPDX-License-Identifier: GPL-3.0-only

// This is a contract with a public function called setA.
// As the property 'a' is public there is a the equivalent
// of a function called a() to retrieve it.

contract CallMe {
    uint public a = 1;
    uint public b = 2;

	// Custom errors
	// https://blog.soliditylang.org/2021/04/21/custom-errors/
	// https://medium.com/coinmonks/solidity-revert-with-custom-error-explained-with-example-d9dff8937ef4
	error NotEnoughGiven(string message, uint value);

    function setB(uint _b) public returns (uint) {
        b = _b;
        if (b < 100) {
            revert NotEnoughGiven("Not enough, I want more", _b);
        }
        return b;
    }

    function setA(uint _a) public returns (uint) {
        a = _a;
        return a;
    }
    
}
