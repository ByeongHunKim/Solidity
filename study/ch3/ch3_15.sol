//SPDX-License-Identifier
pragma solidity >= 0.7.0 < 0.9.0;

contract ch3_15
{
    function myFunc(string memory str) public pure returns(uint, string memory, bytes memory)
    {
        uint num = 99;
        bytes memory byt = hex"01";
        return (num, str, byt);
    }
}

// 함수 참조 타입 사용 시 매개변수, 반환값, 변수 메모리 지정