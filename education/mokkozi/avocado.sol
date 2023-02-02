//SPDX-License-Identifier:GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract shopping_test
{
    uint256 public totalMilk = 0;
    uint256 public totalAvocado = 0;
    bool public hasAvocado = true;

    function buyMilk(uint256 _milkAmount) public returns(uint256)
    {
        totalMilk += _milkAmount;
        return totalMilk;
    }

    function buyAvocado(uint256 _avocadoAmount) public returns(uint256)
    {
        totalAvocado += _avocadoAmount;
        return totalAvocado;
    }

    function setHasAvocado(bool _setState) public returns(bool)
    {
        hasAvocado = _setState;
        return hasAvocado;
    }

    function shopping() public returns(uint256)
    {
        buyMilk(1);

        if (hasAvocado == true)
        {
            buyAvocado(1);
        }
        return totalMilk;
    }
}