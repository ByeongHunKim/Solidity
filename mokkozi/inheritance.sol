//SPDX-License-Identifier:GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;


contract Animal
{
    string public _name;

    constructor(string memory name)
    {
        _name = name;
    }

    function shouting() virtual pure public returns(string memory)
    {
        revert();
        return ".....";
    }
}

contract Cat is Animal("Cat")
{
    constructor()
    {
    }

    function shouting() override pure public returns(string memory)
    {
        return "nayayayayaya";
    }
    
}

contract Dog is Animal("Dog")
{
    constructor()
    {
    }

    function shouting() override pure public returns(string memory)
    {
        return "mung!";
    }
    
}