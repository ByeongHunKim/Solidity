//SPDX-License-Identifier:GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract Bank
{
    event JustFallback(address _from, string message);
    event ReceiveFallback(address _from, uint256 _value, string message);
    event JustFallbackWithFunds(address _from, uint256 _value, string message);

    // fallback() external
    // {
    //     emit JustFallback(msg.sender, "JustFallback is called");
    // }

    // JustGiveMessageWithFunds 사용하는 경우 ( msg.value, HI 출력) 
    fallback() external payable
    {
        emit JustFallbackWithFunds(msg.sender, msg.value, "JustFallbackWithFunds is called");
    }

    receive() external payable
    {
        emit ReceiveFallback(msg.sender, msg.value, "ReceiveFallback is called");
    }

    /* 
        receive() 를 통해서 이더를 받고 있다. 그래서 payable이 붙어야한다.
        외부에서 이더가 보내지기 때문에 external 접근지정자가 붙는다.
        순수하게 이더만 보내졌을 때 receive() 를 통해서 back 컨트랙트가 이더를 받는다.
        이더를 받고나서 ReceiveFallback이벤트가 발동한다.
        msg.sender, msg.value, "ReceiveFallback is called" 누가 얼마나 보냈는지 그리고 message 출력
        
    */
}

contract You
{   
    // receive()
    function DepositWithSend(address payable _to) public payable
    {
        bool success = _to.send(msg.value);
        require(success, "Failed");
    }

    function DepositWithTransfer(address payable _to) public payable
    {
        _to.transfer(msg.value);
    }

    function DepositWithCall(address payable _to) public payable
    {   
        // 0.7~
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed");

    }

    // fallback
    function JustGiveMessage(address _to) public
    {

        // 0.7 ~
        (bool success , ) = _to.call("HI");
        require(success, "Failed");
    }

    // to the fallback() with Funds
    function JustGiveMessageWithFunds(address payable _to) public payable
    {

        // 0.7 ~
        (bool success, ) = _to.call{value:msg.value}("HI");
        require(success, "Failed");
    }
}