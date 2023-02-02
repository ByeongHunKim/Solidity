// SPDX-License-Identifier:  GPL-3.0
pragma solidity >=0.7.0 < 0.9.0;

contract ch2_4 {
    uint a = 1+3;
    uint b = 3-2;
    uint c = 3*2;
    uint d = 3/3;
    uint e = 5%2;
    uint f = 5 ** 2;

    function arithmetic() public view returns(uint, uint, uint, uint, uint, uint) {
        return(a, b, c, d, e, f);
    }
}