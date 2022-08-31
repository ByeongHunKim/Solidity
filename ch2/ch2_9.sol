// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract ch2_9{
    bool a = true && true; // 두 가지 모두 true 이므로 : true
    bool b = true && false; // 둘 중 하나가 false 이므로 : false
    bool c = false && false; // false
    bool d = true || true; // true
    bool e = true || false; // true
    bool f = false || false; // false
    bool g = !false; // true

    function logical() public view returns (bool, bool, bool, bool, bool, bool, bool){
        return(a, b, c, d, e, f, g);
    }
}