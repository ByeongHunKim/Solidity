//SPDX-License-Identifier:GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract for_loop
{
    /*
        for (초기값; 값이 얼마나 forloop을 돌아야 하는지; forloop 한번 돌 때마다 값의 변화;)
        {
            forloop 내용
        }
    */

    // 이벤트
    // 질문1. 왜 event에서는 string에서 memory 를 사용하지 않았는가
    event CountryIndexName(uint256 indexed _indexed, string _name);
    
    // 배열 변수
    // 질문1. 왜 private으로 접근지정자를 선언했는가? 

    string[] private countryList = ["South Korea", "North Korea", "USA", "China", "Japan"];

    // 함수
    // 질문1. emit의 정확한 의미가 무엇인가?
    function forLoopEvents() public
    {
        for(uint256 i = 0; i < countryList.length; i++)
        {   
            // event CountryIndexName(uint256 indexed _indexed, string _name); 여기서 parameter로 받는 1,2 번째 인자값들이다.
            // solidity는 print()가 없어서 이렇게 emit으로 이벤트를 실행시킨다
            emit CountryIndexName(i, countryList[i]);  
        }
    }
}