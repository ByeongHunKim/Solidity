// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract onlyAdults
{
    modifier onlyAdults
    {
        revert("failed");
        _;
    }
    
    function BuyCigarette() public onlyAdults returns(string memory)
    {
        return "succeeded!";
    }

    modifier onlyAdults2(uint256 _age)
    {
        require(_age>18, "failed");
        _;
        // BuyCigarette2(uint256 _age)
    }

    function BuyCigarette2(uint256 _age) public onlyAdults2(_age) returns(string memory)
    {
        return "succeeded!";
    }
}