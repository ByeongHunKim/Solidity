//SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract A {
    uint256 public a = 5;

    function change(uint256 _value) public {
        a = _value;
    }
}

contract B {
    // 인스턴스 정의 -> (상속받을 컨트랙트 이름) (사용할 이름) = new 상속받을컨트랙트이름();
    A instance = new A();

    // view를 사용한 이유는 위에 변수 a를 읽어오고 a값은 안에서 변경하지 않기 때문이다.
    function get_A() public view returns(uint256) {
        return instance.a(); // 변수에선 괄호()를 써줘야 값이 리턴된다.
    }

    function change_A(uint256 _value) public {
        instance.change(_value); // parameter 값도 같이 넣어준다.
    }
}