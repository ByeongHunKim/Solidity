// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract ch3_11{
    uint public a = 3;
    function myFunc() public pure returns(uint) {
        a = 4;
        return a;
    }
}