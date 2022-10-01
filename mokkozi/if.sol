//SPDX-License-Identifier:GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract if_test{
    function ifChech(uint num) public pure returns(string memory){
    if (num == 100){
        return "num is 100!";
    }
    else if (num == 150) {
        return "num is 150!";
    }
    
    return "num isn't valid";
}
}