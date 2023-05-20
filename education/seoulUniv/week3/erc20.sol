// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Token {
    string public _name = "hunsman Token";
    string public _symbol = "HCT";
    uint8 public _decimals = 18;
    uint public totalSupply;
    mapping(address owner => uint) public balances;
    mapping(address owner => mapping(address spender => uint)) public allowances;

    event Transfer(address indexed from, address indexed to, uint amount);
    event Approval(address indexed owner, address indexed spender, uint amount);

    function balanceOf(address owner) public view returns(uint) {
        return balances[owner];
    }

    function allowance(address owner, address spender) public view returns(uint amount){
        return allowances[owner][spender];
    }

    function approve(address spender, uint amount) public returns(bool success){
        allowances[msg.sender][spender] = amount;
        return true;
    }

    function transferFrom(
        address owner,
        address spender,
        uint amount
    ) public returns (bool success) {
        require(allowances[owner][spender] >= amount, 'not approved');
        require(balances[owner] >= amount, 'unefficient balance');
        balances[owner] -= amount;
        balances[spender] += amount;
        allowances[owner][spender] -= amount;
        emit Transfer(owner, spender, amount);
        return true;
    }

    function transfer(address to, uint amount) public returns (bool success) {
        require(balances[msg.sender] >= amount, "unefficient amount");
        balances[msg.sender] -= amount;
        balances[to] += amount;
        emit Transfer(msg.sender, to, amount);
        return true;
    }
}