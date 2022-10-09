//SPDX-License-Identifier-GPL:3.0
pragma solidity >= 0.5.0 < 0.9.0;



contract Bank
{
    event JustFallbackWIthFunds(address _from, uint256 _value, string message);

    function() external payable
    {
        emit JustFallbackWIthFunds(msg.sender, msg.value, "JustFallbackWithFunds is called");
    }
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
        // ~ 0.7
        (bool sent, ) = _to.call.value(msg.value)("");
        require(sent, "Failed to send ether");

        // 0.7~
        // (bool sent, ) = _to.call{value: msg.value}("");
        // require(sent, "Failed");

    }

    // fallback
    function JustGiveMessage(address _to) public
    {
        // ~ 0.7
        (bool sent, ) = _to.call("HI");
        require(sent, "Failed to send ether");

        // 0.7 ~
        // (bool success , ) = _to.call("HI");
        // require(success, "Failed");
    }

    // to the fallback() with Funds
    function JustGiveMessageWithFunds(address payable _to) public payable
    {
        // ~ 0.7
        (bool sent, ) = _to.call.value(msg.value)("HI");
        require(sent, "Failed to send ether");

        // 0.7 ~
        // (bool success, ) = _to.call{value:msg.value}("HI");
        // require(success, "Failed");
    }
}