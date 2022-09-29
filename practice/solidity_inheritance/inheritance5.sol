//SPDX-License-Identifier:GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract Father {
    // memory를 안 쓰는 이유는 저장하지 않기 때문
    event FatherName(string name);
    function who() public virtual {
        emit FatherName("KimFather");
    }
}

contract Mother {
    event MotherName(string name);

    function who() public virtual {
        emit MotherName("KimMother");
    }
}

contract Son is Mother, Father {

    function who() public override(Father, Mother) {
        super.who();
    } 
}