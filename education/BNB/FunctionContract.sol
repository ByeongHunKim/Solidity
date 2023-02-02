// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/*
    함수는 프로그래밍에서 동작에 해당하는 매우 중요한 부분이다.
    변수의 값을 변경하거나 불러오는 등 다양한 형태로 사용할 수 있다.

    view함수와 일반 함수의 차이점은 함수를 호출할 때 transaction이 발생하냐 안하냐이다.
    view함수는 이미 블록체인 네트워크에 있는 정보를 가져오기만 하는 것이기 때문에 state를 변경하지 않는다.
    그래서 트랜잭션을 발생시키지 않기 때문에 tx서명을 안한다.

    하지만, 블록체인 상에서 값을 기록하는 함수는 가스비를 소비한다. 단순히 읽기 전용 함수는 가스비를 사용하지 않는다.
    REMIX 컨트랙트 인스턴스에서 호출하는 함수/변수 칸의 색이 주황색은 가스비를 소모, 남색은 가스비 소모x  
*/

contract FunctionContract{

    int private number = 1000;
    uint public uNumber = 100;
    string private name = "h662";
    bool public isLoading = true;

    // deploy를 했을 때 인스턴스 안에는 public으로 지정된 uNumber, isLoading 변수만 호출할 수 있다.
    // private으로 지정된 number는 함수를 통해서만 호출할 수 있다.


    function callNumber() public view returns(int){
        return number;
    }


    // addOne() 를 호출하고 callNumber를 호출하면 1001이 되는 것을 확인할 수 있다.
    function addOne() public {
        number += 1; // number = number + 1;
    }

    // addX() 를 호출하고 callNumber를 호출하면 파라미터에 넣은 _addNum이 number 변수에 더해진 것을 확인할 수 있다.
    // 134를 넣고 함수를 호출하면 1134가 되고, -134를 넣고 함수를 호출하면 다시 number 변수에는 원래 값인 1000이 되는 것을 확인할 수 있다.
    function addX(int _addNum) public {
        number += _addNum; // number = number + _addNum;
    }
}

