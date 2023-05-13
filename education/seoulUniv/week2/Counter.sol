// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Counter {
    uint private value;
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

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
    
    function resetValue() public onlyOwner returns (bool){
        value = 0;
        return true;
    }

    function withdraw() public onlyOwner payable returns(bool) {
        uint balance = address(this).balance;
        payable(msg.sender).transfer(balance);
        return true;
    }
}