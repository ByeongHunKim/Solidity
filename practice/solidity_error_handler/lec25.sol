//SPDX-License-Identifier:GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract lec25
{
    /*
        0.4.22 ~ 0.7.x

        assert : gas를 다 소비한 후, 특정 조건에 부합하지 않으면 (false일 때) 에러를 발생시킨다
        revert : 조건 없이 에러를 발생시키고, gas를 환불 시켜준다.
        require : 특정한 조건에 부합하지 않으면 (false일 때) 에러를 발생시키고, gas를 환불 시켜준다. if + revert

    */

    function assertNow() public pure //assert(조건문) -> false일 떄
    {
        assert(false);
    }

    function revertNow() public pure
    {
        revert("error!!");
    }

    function requireNow() public pure
    {
        require(false, "occurred");
    }

    function onlyAdults(uint256 _age) public pure returns(string memory)
    {
        if( _age < 19)
        {
            revert("You are not allowed to pay for the cigarette");
        }
        return "Your payment is succeed!";
    }

    function onlyAdults2(uint256 _age) public pure returns(string memory)
    {
        require(_age > 19, "You are now allowed to pay for the cigarette");
        return "Your payment is succeed";
    }

}