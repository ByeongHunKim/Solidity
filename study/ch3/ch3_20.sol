// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract ch3_20
{
  function funcExt() external pure returns(uint)
  {
    return 2;
  }

  function outPutExt() external view returns(uint)
  {
    return this.funcExt();
  }
}