//SPDX-License-Identifier:GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract if_test {
/*

    Case1: if-else
    if(if 가 발동되는 조건) {
        if 내용
    }
    else{
        if가 발동이 안되면 동작할 코드
    }

    Case2: if-else if-else
    if(if가 발동 되는 조건) {
        if내용
    }
    else if(else if 가 발동되는 조건){
        else if 내용
    }
    ...
    else{ if, else if 가 발동이 안되면
        else 내용
    }
*/

    // 예시코드 if -else문
    string private outcome = "";
    function isIt5(uint256 _number) public returns(string memory) {
        // 입력 받은 값이 5와 같다면, outcome에 일치여부 값 넣고 리턴
        if(_number == 5){
            outcome = "it is 5!";
            return outcome;
        }
        // 만약 그렇지 않다면, outcome에 불일치 여부 값 넣고 리턴
        // else{
        //     outcome = "it isn't 5!";
        //     return outcome;
        // }

        // 위의 else문을 쓰지 않고 이렇게 해도 같은 의미이다.
        outcome = "it isn't 5!";
        return outcome;
    }

    function isIt5or3or1(uint256 _number) public returns(string memory) {
        if(_number == 5) {
            outcome = "it is 5!";
            return outcome;
        }
        else if(_number == 3) {
            outcome = "it is 3!";
            return outcome;
        }
        else if(_number == 1) {
            outcome = "it is 1!";
            return outcome;
        }
        else {
            outcome = "it isnt 5, 3 or 1! ";
            return outcome;
        }
    }
}