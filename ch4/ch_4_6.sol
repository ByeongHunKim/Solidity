//SPDX-License-Identifier : GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract ch4_6 {

  function func1() public pure returns(uint) {
    uint result = 0;
    for(uint a =0; a<3; ++a){
      result = result + a;
    }
      return result;
  }
}