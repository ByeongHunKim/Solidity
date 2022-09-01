/*

상수는 변수처럼 자료형과 상수명을 자유롭게 지정할 수 있다. 하지만 명시된 이후 저장한 값을 바꿀 수 없다.
만약 변경을 시도하면 오류가 발생한다.

*/

//SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract ch2_10 {
    uint constant a = 7;
    string constant b = 'lucky';

    function plusA() public pure returns(uint) {
        return a + 7;
    }

}