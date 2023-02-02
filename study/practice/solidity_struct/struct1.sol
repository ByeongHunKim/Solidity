//SPDX-License-Identifier:GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract struct_test {

    // character 라는 구조체를 만들었다
    // 3가지의 변수들이 있다. 즉 캐릭터라는 구조체를 만들기 위해서는 3가지 값을 모두 입력해줘야한다.
    struct Character {
        uint256 age;
        string name;
        string job;
    }

    mapping(uint256=>Character) public CharacterMapping;
    Character[] public CharacterArray;

    // 어떤식으로 struct 생성이 되는지에 대한 함수
    function createCharacter(uint256 _age, string memory _name, string memory _job) pure public returns(Character memory) {
        return Character(_age, _name, _job);
    }

    // mapping에 구조체 형식의 데이터 넣기
    function createCharacterMapping(uint256 _key, uint256 _age, string memory _name, string memory _job) public {
        CharacterMapping[_key] = Character(_age, _name, _job);
    }
    
    // mapping 값 불러오기
    function getCharacterMapping(uint256 _key) public view returns(Character memory) {
        return CharacterMapping[_key];
    }

    // Array에 구조체 형식의 데이터 넣기
    // function createCharacterArray(uint256 _key, uint256 _age, string memory _name, string memory _job) public {
    function createCharacterArray(uint256 _age, string memory _name, string memory _job) public {
        // CharacterArray[_key] = Character(_age, _name, _job);
        CharacterArray.push(Character(_age, _name, _job));
    }

    // Array 값 불러오기
    function getCharacterArray(uint256 _index) public view returns(Character memory) {
        return CharacterArray[_index];
    }
}