pragma solidity >= 0.8.17.0;

// SPDX-License-Identifier: GPL-3.0-only

// The definition of the CallMe contract. We can set
// this up here as we know it in this instance.

contract CallMe {
    function a() public pure returns (uint) {}
    function setA(uint _a) public returns (uint) {}

    // c doesn't exist, I want to see what happens if I try to call it
    function c() public pure returns (uint) {}
    function setC(uint _c) public returns (uint) {}

    // There is also a pair of functions about 'b' but they don't
    // have to be defined here.
}

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

    // Call c() on the dc contract, this should fail in some way.
    function getC() public view returns (uint result) {
        try dc.c() returns (uint r) {
            return r;
        } catch (bytes memory /*lowLevelData*/) {
            revert("Call failed");
        }
    }
    
    // This should also fail.
    function setC(uint _val) public returns (uint result) {
        dc.setC(_val);
        return _val;
    }

    function setB_Signature(uint _val) public returns(bool success){
        (bool sent, bytes memory data) = dcNoABI.call(abi.encodeWithSignature("setB(uint)", _val));

        return true;
    }

}


contract test3 {       
    address watch_addr = address(0x1245689);
    function register(string memory _text) public {
        watch_addr.call(abi.encodeWithSignature("register(string)", _text));
    }
}
