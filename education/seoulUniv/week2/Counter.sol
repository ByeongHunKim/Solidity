// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Counter {
    uint private value;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    event IncreaseValue(address indexed owner, uint value);

    function getValue() public view returns (uint) {
        return value;
    }

    function increaseValue() public payable {
        require(msg.value == 1 ether, "you have to pay 1 ether");
        value+=1;
        emit IncreaseValue(msg.sender, value);
    }
    
    function resetValue() public returns (bool){
        require(msg.sender == owner, 'you are not owner');
        value = 0;
        return true;
    }

    function withdraw() public payable returns(bool) {
        require(msg.sender == owner, 'you are not owner');
        uint balance = address(this).balance;
        payable(msg.sender).transfer(balance);
        return true;
    }
}