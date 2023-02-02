//SPDX-License-Identifier:GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract continue_break
{
    /*
        continue : 다음 반복문으로 이동
        break : 반복문을 끝냄
    */

    event CountryIndexName(uint256 _index, string _name);
    string[] private countryList = ["South Korea", "North Korea", "USA", "China", "Japan"];

    function useContinue() public
    {
        for(uint256 i = 0; i < countryList.length; i++)
        {
            if(i%2==1) // index값 0~4 를 나눈 나머지 값이 1일 때는 스킵, 0이면 (짝수면) 해당 값을 리턴(emit) 0, 2, 4 index값 한국 미국 일본
            {
                continue;
            }
            emit CountryIndexName(i, countryList[i]);
        }
    }

    function useBreak() public
    {
        for(uint256 i = 0; i<countryList.length; i++)
        {
            if(i==2) // 0,1번째 인덱스 값까지만 emit이 된다.
            {
                break;
            }
            emit CountryIndexName(i, countryList[i]);
        }
    }
}