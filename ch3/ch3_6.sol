// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract ch3_6 {
    
    uint public a = 7;
    uint public b = 14;
    function myFunc() public returns(uint, uint) {
        a = 100;
        b = 8;
        return(a, b);
    }
}