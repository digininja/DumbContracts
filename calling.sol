pragma solidity >= 0.8.17.0;

// SPDX-License-Identifier: GPL-3.0-only

// This is a contract with a public function called setA.
// As the property 'a' is public there is a the equivalent
// of a function called a() to retrieve it.

contract CallMe {
    uint public a = 1;
    uint public b = 2;

    function setB(uint _b) public returns (uint) {
        b = _b;
        return b;
    }

    function setA(uint _a) public returns (uint) {
        a = _a;
        return a;
    }
    
}