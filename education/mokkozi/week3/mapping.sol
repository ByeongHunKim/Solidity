//SPDX-License-Identifier:GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract MappingTest
{
    mapping(string=>string) phoneNumberByName;

    constructor()
    {
        phoneNumberByName["tony"] = "010-0000-7414";
        phoneNumberByName["ann"] = "010-1234-1234";
    }

    function getPhoneNumber(string memory name) public view returns(string memory)
    {
        return phoneNumberByName[name];
    }

    function removePhoneNumber(string memory name) public
    {
        delete phoneNumberByName[name];
    }
}
