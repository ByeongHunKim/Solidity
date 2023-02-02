/*
  external 함수는 내부적 접근이 불가능하다.
*/

// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract ch3_19
{
  function funcExt() external pure returns(uint)
  {
    return 2;
  }

  function funcPriv() private pure returns(uint)
  {
    return 3;
  }

  /*
  function outputExt() public pure returns(uint)
  {
    return funcExt();
  }
  */

  function outputPriv() public pure returns(uint)
  {
    return funcPriv(); 
  }
}