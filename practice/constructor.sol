// SPDX-License-Identifier : GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract A {
    
    string public name;
    uint256 public age;

    constructor(string memory _name, uint256 _age) {
        name = _name;
        age = _age;
    }
// A를 B에서 인스턴스화

}