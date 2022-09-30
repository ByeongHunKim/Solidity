//SPDX-License-Identifier:GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

// 19강

contract mapping_array {
    uint num = 89;
    mapping(uint256=> uint256) numMap;
    uint256[] numArray;

    // 변수의 값 변경
    function changeNum(uint256 _num) public {
        num = _num;
    }
    
    // 변수의 값 리턴
    function showNum() public view returns(uint256) {
        return num;
    }

    // numMap Mapping에 값 넣기
    function numMapAdd() public {
        numMap[0] = num;
    }

    // 매핑값 리턴
    function showNumMap() public view returns(uint256) {
        return numMap[0];
    }

    // 배열에 값 추가
    function numArrayAdd() public {
        numArray.push(num);
    }

    // 배열값 첫번째 인덱스 값 리턴
    function showNumArray() public view returns(uint256) {
        return numArray[0];
    }

}