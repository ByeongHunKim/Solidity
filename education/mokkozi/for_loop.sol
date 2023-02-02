//SPDX-License-Identifier:GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

/*
가장 많이 사용되는 반복문 - for문
for문 구성하는 방법
for ( 초기값; 조건; 할당)
{
    code ....
}

*/

contract for_loop
{
    function forloop() public pure returns(uint256)
    {
        uint result = 0;
        for ( uint256 condition = 0; condition < 10; condition++)
        {
            result += condition;
        }

        return result;
    }

/*
while반복문
조건이 false가 될 때 까지 계속 코드를 반복ㅂ 한다.
while문 구성하는 방법
while (조건)
{
    code ...
}
*/
    // function whileLoop() public pure returns(uint256)
    // {

    // }

/*
do while문
*/
}