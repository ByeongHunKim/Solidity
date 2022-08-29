// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 < 0.9.0;

contract ch2_6 {
    uint test = 5;

    function justTest() public view returns(uint){
        return test;
    }

    function prePlus() public returns(uint){
        return ++test; // test = test + 1
    }
    
    function postPlus() public returns(uint){
        return test++; 
    }
}