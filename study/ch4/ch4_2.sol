//SPDX-License-Identifier : GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract ch4_2 {

  function func1(uint a) public pure returns(uint) {
    if(a >= 10) {
      a = 9;
    } else {
      a = 10;
    }
    return a;
  }
}