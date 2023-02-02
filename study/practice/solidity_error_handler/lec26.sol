//SPDX-License-Identifier:GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

// 에러 핸들러 : require, revert, assert, try/catch

contract lec26
{

    /*
        0.8.0 포함 x
        0.8.1 ~ 포함 o
        assert: 오직 내부적 에러 테스트 용도, 불변성 체크 용도
                assert가 에러를 발생시키면, Panic(uint256) 이라는 에러 타입의 에러 발생
        Panic은 try/catch 문에서 알아볼 것 (0.8.1 버전부터 있다.)
    */
    
    function assertNow() public pure
    {
        assert(false);
    }

    function revertNow(uint256 _age) public pure returns(string memory)
    {
        if(_age < 19)
        {
            revert("failed");
        }
        return "your payment is succeed!";
    }

    function requireNow(uint256 _age) public pure return(string memory)
    {
        require(_age > 19, "failed");
        return "your payment is succeed! ";
    }

}