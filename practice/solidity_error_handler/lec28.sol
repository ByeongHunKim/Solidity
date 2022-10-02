//SPDX-License-Identifier:GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

// 외부 스마트 컨트랙트를 생성할 떄 : 다른 컨트랙트를 인스턴스화 생성할 때 사용
contract character
{
    string private name;
    uint256 private power;

    constructor(string memory _name, uint256 _power)
    {   
        name = _name;
        power = _power;
    }
}

contract runner
{
    event catchOnly(string _name, string _err);

    function playTryCatch(string memory _name, uint256 _power) public returns(bool)
    {
        try new character(_name, _power) {
            revert("errors in the try/catch block");
            return (true);
        } catch {
            emit catchOnly("catch", "ErrorS!!");
            return(false);
        }
    }
}


// 스마트 컨트랙트 내에서 함수를 호출 할 때 : this를 통해 try/catch 사용

contract runner2
{
    function simple() public returns(uint256)
    {   
        revert("error");
        return 4;
    }

    event catchOnly(string _name, string _err);
    function playTryCatch() public returns(uint256, bool)
    {
        try this.simple() returns(uint256 _value){
            return(_value, true);
        }
        catch {
            emit catchOnly("catch", "ErrorS!");
            return(0, false);
        }
    }
}