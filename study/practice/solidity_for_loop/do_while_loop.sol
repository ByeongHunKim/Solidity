//SPDX-License-Identifier:GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract do_while_loop
{
    /*
        초기값
        do
        {
            do_while_loop 내용
        }
        while (값이 얼마나 do_while_loop을 돌아야 하는지)
    */

    event CountryIndexName(uint256 _index, string _name);
    string[] private countryList = ["South Korea", "North Korea", "USA", "China", "Japan"];
 
    function doWhileLoopEvents() public
    {
        uint256 i = 0;
        do
        {
            emit CountryIndexName(i, countryList[i]);
            i++;
        }
        while (i < countryList.length);
    }
}   
