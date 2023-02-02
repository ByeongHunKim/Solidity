//SPDX-License-Identifier:GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract dice2
{   
    address public ownerAddress;
    constructor()
    {
        ownerAddress = msg.sender;
    }

    function random() public returns(uint256)
    {
        return uint256(keccak256(abi.encodePacked(block.difficulty, block.timestamp)));
    }
    function getRandom(uint256 _usernum) public returns(bool)
    {
        uint256 div = random() % 6;
        uint256 diceNumber = div + 1;
        require(_usernum == diceNumber, "correct");
        return true;
    }

    function dice(uint256 _userNum) public payable returns(bool)
    {   
        // 랜덤한 값을 넣어서 비교 한다.
         getRandom(_userNum);
        // 조건 입력 받은 넘버가 6 이하가 맞는지, 입력받은 넘버가 같은지, 컨트랙트를 호출한 지갑의 잔액이 1ether이상인지
        require(_userNum <= 6 &&  msg.sender.balance > 1*1e18 , "can be allowed");
        return msg.sender.transfer(2*1e18);
    }
}