//SPDX-License-Identifier:GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

/*
주소.balance
ㄴ> 특정 주소의 현재 갖고 있는 이더의 잔액을 나타낸다. (msg.value는 송금액)
ㄴ> 주소.balance와 같은 형태로 사용한다.

msg.sender
ㄴ> 스마트 컨트랙트를 사용하는 주체 (호출한 지갑 주소)
ㄴ> msg.sender는 앞으로 설명해야할 call vs delegate call에서 주요 내용이다.
*/

contract MobileBanking
{   
    // 3개의 이벤트는 각각 함수에서 사용된다.
    event SendInfo(address _msgSender, uint256 _currentValue);
    // address와 value값을 출력하는 이벤트
    event MyCurrentValue(address _msgSender, uint256 _value);
    event CurrentValueOfSomeone(address _msgSender, address _to, uint256 _value);

    // 이더리움 전송 함수. 인자로 보낼 to주소를 받는다. 이더리움을 받아야하기 때문에 , payable 지정. 
    // 함수 자체도 이더리움을 보내기 때문에, payable 지정
    // 만약 컨트랙트 호출자(from)의 잔액이 입력한 잔액보다 작으면, tx취소.
    function sendEther(address payable _to) public payable
    {
        require(msg.sender.balance >= msg.value, "your balance is not enough");
        _to.transfer(msg.value);
        emit SendInfo(msg.sender, (msg.sender).balance);
    }

    // 컨트랙트 호출자의 잔액 조회
    function checkValueNow() public
    {
        emit MyCurrentValue(msg.sender, msg.sender.balance);
    }

    // 컨트랙트 호출자, 컨트랙트 호출자가 이더를 전송할 to 주소, to주소의 보유 잔액
    function checkUserMoney(address _to) public
    {
        emit CurrentValueOfSomeone(msg.sender, _to, _to.balance);
    }
}
