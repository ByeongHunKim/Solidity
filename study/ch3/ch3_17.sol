/*
    상태 변수와 지역 변수의 차이점

    상태 변수: 함수 외부에 정의된 변수 a

    지역 변수: myfunc1에 정의된 변수 b
    ㄴ> 지역 변수를 정의할 때는 접근지정자를 명시할 필요가 없다.
    ㄴ> 지역 변수가 정의된 함수 밖에서 사용할 수 없다.

*/

// SPDX-License-Identifier : GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract ch3_17
{
    uint public a = 3;

    function myfunc1() external view returns(uint, uint)
    {
        uint b =4;
        return(a, b);
    }

    /*

    function myFunc2() external pure returns(uint)
    {
        return b;
    }
    */
}