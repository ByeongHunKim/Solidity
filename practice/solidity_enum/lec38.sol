//SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

/*
    enum : 사람이 읽을 수 있게, 사용자/ 개발자에 의해 정의된 상수 세트를 타입 (uint8 = 0~255(2^8-1))

    enum 이름 {}
*/

contract lec38
{   
    // 자동차의 상태를 나타내는데, 그 안에는 여러가지 enum이 있다. 0~3으로 값이 지정된다.
    // 자동차의 상태에 따라서 require를 통해 특정한 함수를 실행시키려고 한다.
    enum CarStatus
    {
        TurnOff,
        TurnOn,
        Driving,
        Stop
    }

    // CarStatus 라는 타입의 변수를 선언 why? 현재 상태의 조건이 어떤지 알아야하기 때문.
    CarStatus public carStatus;

    // 생성자(constuctor)를 통하여 초기값을 설정해준다.
    // 컨트랙트가 배포될 때 carStatus 값은 CarStatus.TurnOff으로 설정된다.
    constructor()
    {
        carStatus = CarStatus.TurnOff;
    }

    // CarStatus와 상태를 int화 시킨 값이 emit으로 출력된다.
    event carCurrencyStatus(CarStatus _carStatus, uint256 _carStatusInInt);

    // 자동차 시동을 켜주는 함수
    // 그러면 무조건 시동이 꺼져있어야한다. 그래서 생성자로 초기값을 설정해준 것. 그래서 require로 carStatus값이 TurnOff와 같아야한다는 조건이 걸려있다.
    function turnOnCar() public
    {
        require(carStatus == CarStatus.TurnOff, "To turn on, your car must be turned off");
        carStatus = CarStatus.TurnOn;
        // _carStatus값도 숫자를 가지고 있긴하지만 데이터 타입이 CarStatus이다. (uint가 아님) 그렇기 때문에 uint256으로 출력을 시키려면 변환을 시켜야한다.
        emit carCurrencyStatus(carStatus, uint256(carStatus));
    }

    function DrivingCar() public
    {
        require(carStatus == CarStatus.TurnOn, "To drive a car, your car must be turned on");
        carStatus = CarStatus.Driving;
        emit carCurrencyStatus(carStatus, uint256(carStatus));
    }

    function StopCar() public
    {
        require(carStatus == CarStatus.Driving, "To stop a car, your car, your car must be driving");
        carStatus = CarStatus.Stop;
        emit carCurrencyStatus(carStatus, uint256(carStatus));
    }

    function turnOffCar() public
    {   // carStatus 값이 1, 3 이어야만 (시동만 켜져있거나, 멈춰있는 상태에서 )함수를 실행시킬 수 있다.
        require(carStatus == CarStatus.TurnOn || carStatus == CarStatus.Stop, "To turn off, your car must be turned on or Driving");
        carStatus = CarStatus.TurnOff;
        emit carCurrencyStatus(carStatus, uint256(carStatus));
    }

    // 함수를 호출할 때 마다 현재 carStatus값이 나온다. 하지만 이 변수의 타입은 CarStatus이기 때문에 returns안에 uint256을 넣어주면 에러가 난다.
    function checkStatus() public view returns(CarStatus)
    {
        return carStatus;
    }
}