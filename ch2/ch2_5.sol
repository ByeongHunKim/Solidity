// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 < 0.9.0;

contract ch2_5 {
    uint a= 5;
    uint b= 5;
    uint c= 5;
    uint d= 5;
    uint e= 5;

    function compoundAssignment() public returns(uint, uint, uint, uint, uint){
        a += 2; // a = a + 2;
        b -= 2; // b = b - 2;
        c *= 2; // c = c * 2;
        d /= 2; // d = d / 2;
        e %= 2; // e = e % 2;
        
        return(a, b, c, d, e);
    }
}

// 복합 할당 연산자 ( += , -=, *=, /=, %=)

// output

/*
	"0": "uint256: 7",
	"1": "uint256: 3",
	"2": "uint256: 10",
	"3": "uint256: 2",
	"4": "uint256: 1"
*/

// solidity는 소수점을 지원하지 않으므로 e / 2 의 값은 2.5가 아니라 2가 나왔다.
