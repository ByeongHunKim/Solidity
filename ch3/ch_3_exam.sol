//SPDX-License-Identifier : MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract quiz1{
    function returnValue5() public pure returns (uint256){
        return 5;
    }
}

contract quiz2{
    function getString(string memory _str) public pure returns (string memory) {
        return _str;
    }
}

contract quiz3{

    uint256 num = 2;

    function doubledNum() public returns(uint256) {
        num = num * 2;
        return num;
    } 
}

contract quiz4 {
    function returnTwoValues() public pure returns (string memory, uint256) {
        return ("Hello solidity", 5);
    }
}

