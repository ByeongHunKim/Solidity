// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 < 0.9.0;

contract ch2_8 {
    bool a = 3>4;
    bool b = 3<4;
    bool c = 5>=2;
    bool d = 5<=5;
    bool e = 3==3;
    bool f = 3!=1;

    function comparison() public view returns(bool, bool, bool, bool, bool, bool) {
        return(a, b, c, d, e, f);
    }
}