// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract pure_view {
    // 1. view를 사용한 경우
    // uint256 public a = 5;

    // function changeA() public view returns (uint256) {
    //     return a + 2;
    // }

    // 2. pure를 사용한 경우

    // uint256 public a = 5;
    
    // function changeA_1() public pure returns(uint256) {
    //   return a + 2;
    // }

    // 3. 둘 다 사용하지 않는 경우

    uint256 public a = 5;
    
    function changeA_3() public returns(uint256){
      a = 13;
      return a;
    }
}
