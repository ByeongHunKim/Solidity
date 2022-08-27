// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 < 0.9.0;

// 0.7.0 dptj 0.9.0까지 적용할 수 있다.

contract ch2_2 {
    string a = "initial value";

    function assignment() public returns(string memory){
        a = "hello solidity";
        return(a);
    }
}

// ch2.2는 대입 연산자에 대한 내용이다.

// 변수 a는 saturday라는 초깃깂을 갖으며 자료형 string이다.

// assignment 함수에서 확인 할 수 있듯이, 대입연산자를 통해서 "hello solidity" 를 갖게 되었다.