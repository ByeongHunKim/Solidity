/*
    함수와 가시성 지정자

*/

// SPDX-License-Identifier : GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract ch3_18
{
    uint public pub = 1;

    uint private priv = 2;
    uint internal inter = 3;
    // uint external ext = 4;

    function funcPub() public view returns(uint, uint, uint)
    {
        return (pub, priv, inter);
    }

    function funcPriv() private view returns(uint, uint, uint)
    {
        return (pub, priv, inter);
    }

    function funcInter() internal view returns(uint, uint, uint)
    {
        return (pub, priv, inter);
    }

    function funcExt() external view returns(uint, uint, uint)
    {
        return (pub, priv, inter);
    }
}