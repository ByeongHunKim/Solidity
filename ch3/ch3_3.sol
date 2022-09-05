// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract ch3_3 {
    uint public a = 3;
    function myfunc(uint b) public {
        a = b;
    }
}