//SPDX-License-Identifier:GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract array_test {
    // 사이즈가 제한이 되어있지 않은 배열
    uint256[] public ageArray;

    // length가 10인 배열
    uint256[10] public ageFixedSizeArray;
    // 인덱스0부터 9까지 추가 가능 
    // 원하는 사이즈의 값을 넣어서 제한할 수 있다.

    // 배열의 값들을 미리 정의하는 배열
    string[] public nameArray = ["hun", "kim", "lee"];
}
