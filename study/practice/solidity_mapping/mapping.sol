//SPDX-License-Identifier:GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract mapping_test {
    // mapping 정의
    mapping(uint256=>uint256) private ageList;
    // item이름을 넣으면 가격이 나온다
    mapping(string=>uint256) private priceList;
    // 인덱스를 넣었을 때 키값의 대응하는 이름을 나오게 하는 매핑
    mapping(uint256=>string) private nameList;

    // key, value값을 넣어주는 함수 index는 키값, age는 value값
    function setAgeList(uint256 _index, uint256 _age) public {
        ageList[_index] = _age;
    }

    // value값을 리턴하는 함수
    function getAge(uint256 _index) public view returns(uint256) {
        return ageList[_index];
    }

    function setNameList(uint256 _index, string memory _name) public {
        nameList[_index] = _name;
    }

    function getName(uint256 _index) public view returns(string memory) {
        return nameList[_index];
    }
    
    function setPriceList(string memory _itemName, uint256 _price) public {
        priceList[_itemName] = _price;
    }

    function getPriceList(string memory _index) public view returns(uint256) {
        return priceList[_index];
    }
}