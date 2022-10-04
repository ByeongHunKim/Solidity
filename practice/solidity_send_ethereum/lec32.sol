//SPDX-License-Identifier:GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract lec32
{
    /*
    Payable
    Payable은 이더/토큰과 상호 작용 시 필요한 키워드라고 생각하면 된다.
    즉, send, transfer, call을 통해 이용, 이더리움을 보낼 때 payable이라는 키워드가 필요하다.
    이 Payable은 주로 함수, 주소, 생성자에 붙여서 사용된다.

    msg.value
    송금 보낸 코인의 값

    이더를 보내는 3가지
        1.send : 2300 gas를 소비 , 성공 여부를 true, false로 리턴
        2.transfer : 2300 gas를 소비 , 실패 시 에러 발생
        3.call : 가변적인 gas소비 (gas값 지정 가능), 성공여부를 true / false로 리턴
                재진입 (reentrancy) 공격 위험성으로 19년 12월 이후 call 사용 추천
    */

    // trasfer 

    event howMuch(uint256 _value);

    // 이더리움을 보내는 방법 첫번째 : send 
    // send는 true/false를 나와서 require 
    function sendNow(address payable _to) public payable
    {
        bool sent = _to.send(msg.value); // return true / false
        require(sent, "Failed to send ethereum");
        emit howMuch(msg.value);
    }

    // 이더리움을 보내는 방법 두번째 : transfer 
    // transfer 자체에 에러를 걸러준다. 실패 시, emit으로 이벤트가 나오지 않는다.
    function transferNow(address payable _to) public payable
    {
        _to.transfer(msg.value);
        emit howMuch(msg.value);
    }

    // 이더리움을 보내는 방법 세번째 : call
    function callNow(address payable _to) public payable
    {
        // ~ 0.7
        // (bool sent,) = _to.call.gas(1000).value(msg.value)("");
        // require(sent, "Failed to send Ethereum / MATIC");

        // 0.7 ~
        (bool sent, ) = _to.call{value: msg.value , gas:1000}("");
        require(sent, "Fail to send Ethereum / MATIC");
        emit howMuch(msg.value);
    }
}