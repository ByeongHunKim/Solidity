//SPDX-License-Identifier : MIT

pragma solidity ^0.8.0;

contract ERC20 {

    // 잔액 관리
    mapping(address => uint) private _balances;
    // 얼마나 돈을 이동시킬 수 있는 권한을 설정 
    mapping(address => mapping(address=> uint)) private _allowances;
    uint private _totalSupply;
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    address public owner;

    modifier checkBalance(uint amount) {
        require(_balances[msg.sender] > amount, "Not Sufficient Balance");
        _;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only Owner");
        _;
    }

    event Transfer(address indexed from, address indexed to, uint amount);
    event Approval(address indexed from, address indexed to, uint amount);

    constructor(string memory _name_, string memory _symbol_, uint8 _decimals_){
        _name = _name_;
        _symbol = _symbol_;
        _decimals = _decimals_;
        _totalSupply = 40000000000000000000000000;
        owner = msg.sender;
    }

    // 1
    function name() public view returns (string memory) {
        return _name;
    }

    // 2 
    function symbol() public view returns (string memory) {
        return _symbol;
    }

    // 3 
    function decimals() public view returns (uint8) {
        return _decimals;
    }

    // 4
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }


    // 5
    function balanceOf(address account) public view returns(uint256) {
        return _balances[account];
    }

    // 6
    function transfer(address to, uint256 amount) public checkBalance(amount) returns (bool) {
        _balances[msg.sender] -= amount;
        _balances[to] += amount;

        emit Transfer(msg.sender, to, amount);
        return true;
    }

    // 7
    function allowance(address owner, address spender) public view returns (uint256) {

        return _allowances[owner][spender];

    }

    // 8. 권한 설정
    function approve(address spender, uint256 amount) public checkBalance(amount) returns (bool) {

        _allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }


    // 9. ERC20 mint 함수
    function mint(address to, uint amount ) public onlyOwner {
        require(amount <= _totalSupply, "max supply is 10000000 AYM");
        _balances[to] += amount;
        _totalSupply += amount;
        

    }

    // 10.
    function burn(address to, uint amount) public onlyOwner {
        
        _balances[to] -= amount;
        _totalSupply -= amount;

    }

    // 11.
    function burnByUser(uint amount) public {
        transfer(address(0),amount);
        _totalSupply -= amount;
    }

    // 12.
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) public returns (bool) {

        require(_balances[from] > amount, "Not Sufficient Balance");
        require(_allowances[from][to] > amount, "Not Allowed Amount");
        require(to == msg.sender, "You cannot transfer yourself");

        _balances[from] -= amount;
        _balances[to] += amount;
        emit Transfer(from, to, amount);
        return true;

    }

    

}