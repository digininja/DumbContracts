pragma solidity >= 0.8.17.0;

// SPDX-License-Identifier: GPL-3.0-only

// The definition of the CallMe contract. We can set
// this up here as we know it in this instance.

import "./calling.sol";

/*
contract CallMe {
    function a() public pure returns (uint) {}
    function setA(uint _a) public returns (uint) {}

    // c doesn't exist, I want to see what happens if I try to call it
    function c() public pure returns (uint) {}
    function setC(uint _c) public returns (uint) {}

    // There is also a pair of functions about 'b' but they don't
    // have to be defined here.
}
*/

// This contract uses the above as a structure to use with the 
// address passed in.

contract MakeCall {
    CallMe dc;
    address dcNoABI;

    // We pass the address of the contract in here.
    function Existing(address _t) public {
        dc = CallMe(_t);
        dcNoABI = _t; 
    }
 
    // Call a() on the dc contract.
    function getA() public view returns (uint result) {
        return dc.a();
    }
    
    function setA(uint _val) public returns (uint result) {
        dc.setA(_val);
        return _val;
    }

    // Trying to work out how to make a call without the definition.
    function setA_Signature(uint _val) public returns(bool success){
        // This is the shorter way to do this
        // (bool sent, bytes memory data) = dcNoABI.call(abi.encodeWithSignature("setB(uint256)", _val));

        // The longer way, generate and store the payload
        bytes memory payload;
        // The parameter is uint256, not just uint, that is very important.
        payload = abi.encodeWithSignature("setA(uint256)", _val);
        // Then pass it.
        (bool sent,) =  dcNoABI.call(payload);
        require(sent, "Call failed");
        return true;
    }
    // Trying to work out how to make a call without the definition.
    function setB_Signature(uint _val) public returns(bool success){
//        (bool sent, bytes memory data) = dcNoABI.call(abi.encodeWithSignature("setB(uint)", _val));
        (bool sent,) =  dcNoABI.call(abi.encodeWithSignature("setB(uint256)", _val));
        return sent;
    }
}
