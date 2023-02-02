//SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract ch2_quiz2{
    bool public a = true || true || false;
    bool public b = true && true && false;
    bool public c = true || true && false;
}

// a = true
// b = false
// c = false