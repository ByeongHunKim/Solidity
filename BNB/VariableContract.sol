//SPDX-License-Identifier : MIT

pragma solidity ^0.8.7;

contract VariableContract {
    int public number = 1000;
    uint public uNumber = 100;
    // 굳이 - 값을 쓰지 않는다면 uint를 사용해서 코딩

    string public name = "h662";
    bool public isLoading = true;
    // 컨트랙트 배포 후 좌측 인스턴스에서 변수를 클릭하는 것이 실제로는 변수를 호출하는 것
    // 변수를 호출할 수 있는 이유는, public 으로 접근지정자가 등록되어있기 때문.

}