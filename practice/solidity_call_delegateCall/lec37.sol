// SPDX-License-Identifier : GPL-3.0

pragma solidity >= 0.7.0 < 0.9.0;

/*
    CALL VS Delegate Call

    Delegate call 
    1. msg.sender가 본래의 스마트 컨트랙트 사용자를 의미한다.
    2. delegate call 이 정의된 스마트 컨트랙트(caller)가 외부 컨트랙트의 함수들 마치 자신의 것 처럼 사용 (실질적인 값도 caller에 저장)

    조건
    외부 스마트 컨트랙트와 caller 스마트 컨트랙트는 같은 변수를 가지고 있어야한다.

    why? -> upgrade smart contract

*/

contract add
{
    uint256 public num = 0;
    event Info(address _addr, uint256 _num);

    function plusOne() public
    {
        num += 2;
        emit Info(msg.sender, num);
    }
}

contract caller
{
    uint256 public num = 0;
    
    function callNow(address _contractAddr) public payable
    {
        (bool success,) = _contractAddr.call(abi.encodeWithSignature("plusOne()"));
        require(success, "failed to transfer ether");
    }
    
    function delegateCallNow(address _contractAddr) public payable
    {
        (bool success,) = _contractAddr.delegatecall(abi.encodeWithSignature("plusOne()"));
        require(success, "failed to transfer ether");
    }
}