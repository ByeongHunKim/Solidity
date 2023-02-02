//SPDX-License-Identifier:GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract while_loop
{
    /*
        초기값 

        while( 값이 얼마나 whileloop을 돌아야 하는지 )
        {
            whileloop 내용
            whileloop 한번 돌때마다 값의 변화;
        }
    */

    event CountryIndexName (uint256 _index, string _name);
    string[] private countryList = ["South Korea", "North Korea", "USA", "China", "Japan"];


    function whileLoopEvents() public
    {
        uint256 i = 0;
        while (i<countryList.length)
        {
            emit CountryIndexName(i, countryList[i]);
            i++;
        }
    }
}