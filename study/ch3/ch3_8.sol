// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract ch3_8 {

    uint public a = 30;
    uint public b = myFunc();
    function myFunc() public returns(uint) {
        a = 100;
        return a;
    }
}