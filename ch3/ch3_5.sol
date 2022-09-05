// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract ch3_5 {
    uint public a = 8;
    function myfunc() public returns(uint){
        a = 100;
        return a;
    }
}