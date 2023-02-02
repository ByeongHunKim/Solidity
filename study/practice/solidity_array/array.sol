//SPDX-License-Identifier:GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract array_test {

    uint256[] public ageArray;

    // 배열의 길이를 알아내는 함수
    function AgeLength() public view returns(uint256) {
        return ageArray.length;
    }
    
    // 배열에 값을 추가하는 함수
    function AgePush(uint256 _age) public {
        ageArray.push(_age);
    }

    // 배열의 값을 알아내는 함수
    function AgeGet(uint256 _index) public view returns(uint256) {
        return ageArray[_index];
    }

    // 배열의 값을 삭제하는 함수1 -> 가장 최신의 값을 삭제
    function AgePop() public {
        ageArray.pop();
    }

    // 배열의 값을 삭제하는 함수2 -> index를 파라미터로 받아서 삭제 -> 하지만 완전히 삭제x -> 길이도 남고, 0으로 채워짐
    function AgeDelete(uint256 _index) public {
        delete ageArray[_index];
    }

    // 배열의 값을 변경하는 함수
    function AgeChange(uint256 _index, uint256 _age) public {
        ageArray[_index] = _age;
    }
}