//SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.7.0 < 0.9.0;

/*
    interface : 스마트 컨트랙트 내에서 정의되어야 할 필요한 것

    1. 함수는 external로 표시 ( calldata )
    2. enum, struct 가능
    3. 변수, 생성자(constructor) 불가 
*/

interface ItemInfo
{
    struct item
    {
        string name;
        uint256 price;
    }
    
    function addItemInfo(string memory _name, uint256 _price) external;
    function getItemInfo(uint256 _index) external view returns(item memory);
}

// lec39 컨트랙트는 is를 통해 ItemInfo interface를 적용 받았다.
// interface에서 선언된 함수를 사용하기 위해서는 함수 이름, parameter값, return 값을 같이 맞춰주고 override 를 적용 시켜줘야한다.
contract lec39 is ItemInfo
{
    item[] public itemList;

    function addItemInfo(string memory _name, uint256 _price) override public
    {
        itemList.push(item(_name, _price));
    }

    function getItemInfo(uint256 _index) override public view returns(item memory)
    {
        return itemList[_index];
    }

}