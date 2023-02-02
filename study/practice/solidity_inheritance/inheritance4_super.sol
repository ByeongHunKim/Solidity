//SPDX-License-Identifier:GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract Father {
    event FatherName(string name);
    function who() public virtual {
        emit FatherName("KimByeongHun123");
    }
}

// contract Son is Father {
//     event sonName(string name);
//     function who() public override {
//         emit FatherName("KimByeongHun");
//         emit sonName("KimHun");
//     }
// }

contract Son is Father {
    event sonName(string name);
    function who() public override {
        super.who();
        emit sonName("KimHun");
    }
}