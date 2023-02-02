//SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract ch3_16
{
    function myFunc(string calldata str) external pure returns(string memory)
    {
        return str;
    }
}