//SPDX-License-Identifier:GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract linear_search
{
    event CountryIndexName(uint256 indexed _index, string _name);
    string[] private countryList = ["South Korea", "North Korea", "USA", "China", "Japan"];

    function linearSearch(string memory _search) public view returns(uint256, string memory)
    {
        for(uint i=0; i<countryList.length; i++)
        {   // string값은 솔리디티 내에서 비교가 불가능하다.
            if(keccak256(bytes(countryList[i])) == keccak256(bytes(_search)))
            {
                return (i, countryList[i]);
            }
        }
        return (0, "Nothing");
    }
}