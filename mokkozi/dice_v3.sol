//SPDX-License-Identifier:GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

/*
1. 1이더로 참가비를 꼭 내야한다 (완료)
2. 숫자를 맞춘 사람에게 2이더를 준다
3. 맞추지 못하면 1이더가 차감된다 
4. 컨트랙트의 owner는 컨트랙트에 쌓인 이더를 이체할 수 있다 (완료)
*/

contract dice_game
{   
    event is_winner(bool result);
    
    // 컨트랙트 배포자
    address owner;

    constructor() payable
    {
        owner = msg.sender;
    }
    
    // receive() external payable{}

    function checkValue() public view returns(uint256)
    {
        return address(this).balance;
    }

    function random() view public returns(uint256)
    {
        return uint256(keccak256(abi.encodePacked(block.difficulty, block.timestamp)));
    }

    function game(uint256 _num) external payable
    {   
        require(address(this).balance > 2 ether, "contract dont have enough ETH");
        require(msg.value == 1 ether, "you have to pay 1 ether");
        uint256 random_numebr = random() % 6;
        uint256 diceNumber = random_numebr + 1;
        if(diceNumber == _num)
        {   
            payable(msg.sender).transfer(2 ether);
            emit is_winner(true);
        }else{
            payable(address(this)).transfer(1 ether);
            emit is_winner(false);
        }
    }

    function withdraw_by_owner() external payable
    {   
        require(owner == msg.sender, "only owner can withdraw the value");
        uint256 contract_has_balance = address(this).balance;
        payable(msg.sender).transfer(contract_has_balance);
    }

}