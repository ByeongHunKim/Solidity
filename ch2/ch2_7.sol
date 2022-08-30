// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 < 0.9.0;

contract ch2_7{
    uint a = 5;

    function justTest() public view returns(uint){
        return a;
    }

    function preMinus() public returns(uint){
        return --a; // a = a - 1;
    }

    function postMinis() public returns(uint){
        return --a; // a = a - 1;
    }
}