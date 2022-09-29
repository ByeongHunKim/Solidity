//SPDX-License-Identifier:GPL-3.0

pragma solidity >= 0.7.0 < 0.9.0;

contract A {
    
    string public name;
    uint256 public age;

    constructor(string memory _name, uint256 _age) {
        name = _name;
        age = _age;
    }
    
    function change_info(string memory _name, uint256 _age) public {
        name = _name;
        age = _age;
    }
}

// A를 B에서 인스턴스화

contract B {
    
    A instance = new A("hunsman", 26);

    function get() public view returns(string memory, uint256) {
        return (instance.name(), instance.age());
    }

    function change_info(string memory _name, uint256 _age) public {
        instance.change_info(_name, _age);
    }
}