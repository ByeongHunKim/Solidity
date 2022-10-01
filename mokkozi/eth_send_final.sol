//SPDX-License-Identifier:GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract test
{
    address public ownerAddress;
    constructor()
    {
        ownerAddress = msg.sender;
    }

    // 호출자의 eth address 조회
    function getSenderAddress() public returns(address )
    {
        return msg.sender;
    }

    // 컨트랙트 호출자의 eth value
    function getSenderBalance() public returns(uint256)
    {
        return msg.sender.balance;
    }

    // 컨트랙트 호출자가 입력한 toAddr 과 value를 전송
    function sendTo(address payable toAddress) public payable returns(bool)
    {
        require(msg.sender != toAddress, "same");
        return toAddress.send(msg.value);
    }

    // 이 컨트랙트의 balance 조회
    function getContractBalance() public returns(uint256)
    {
        address contractAddress = address(this);
        return contractAddress.balance;
    }

    function saveContract() public payable returns(bool)
    {
        // 쌓인 컨트랙트..
    }

    // 컨트랙트의 잔액 조회
    function takeContractBalance() public payable
    {
        address contractAddress = address(this);
        address payable owner = payable(ownerAddress);
        owner.transfer(contractAddress.balance);
    }
}