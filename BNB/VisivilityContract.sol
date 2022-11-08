// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/*
    가시성이라고 부른다. 어디까지 보여줄건가에 대한 내용
    이러한 가시성에는 public, private, internal, external 총 네 가지가 존재한다.
*/

contract VisivlityContract{
    
    int private number = 1000;
    uint public uNumber = 100;
    string private name = "h662";
    bool public isLoading = true;

    // deploy를 했을 때 인스턴스 안에는 public으로 지정된 uNumber, isLoading 변수만 호출할 수 있다.
    // private으로 지정된 number는 함수를 통해서만 호출할 수 있다.


    function callNumber() public view returns(int){
        return number;
    }
}

