//SPDX-License-Identifier:GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract MobileBanking
{   
    constructor() payable
    {
        
    }

    event sendInfo(address _msgSender, uint256 _currentValue);
    event MyCurrentValue(address _msgSender, uint256 _value);
    event CurrentValueOfSomeone(address _msgSender, address _to, uint256 _value);

    function sendEther(address payable _to) public payable
    {   // (컨트랙트 호출자의 지갑 잔액 >= 입력한 전송금액) 조건에 맞아야만 실행 아니면 "Your balance is not enough"
        require(msg.sender.balance >= msg.value, "Your balance is not enough");
        _to.transfer(msg.value);
        emit sendInfo(msg.sender, (msg.sender).balance);
    }

    function checkValueNow() public
    {
        emit MyCurrentValue(msg.sender, msg.sender.balance);
    }

    function checkUserMoney(address _to) public
    {
        emit CurrentValueOfSomeone(msg.sender, _to, _to.balance);
    }
}