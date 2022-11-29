// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MintNFT is ERC721Enumerable, Ownable {
    uint public totalNFT;
    string public metadataURI;
    string public notRevealedURI;
    bool public isRevealed;
    mapping(address => uint) public whitelist;

    // nft token id => revealtime
    mapping(uint => uint) public revealTime;

    constructor(string memory _metadataURI, string memory _notRevealedURI, uint _totalNFT) ERC721("BNB,Challenger", "BC") {
        metadataURI = _metadataURI;
        notRevealedURI = _notRevealedURI;
        totalNFT = _totalNFT;
    }

    function setRevealTime(uint _tokenId, uint _revealTime) public onlyOwner {
        revealTime[_tokenId] = _revealTime;
    }

    function mintNFT() public payable {
        require(totalNFT > totalSupply(), "No more mint.");
        require(msg.value >= 1 ether, "Not Enough BNB.");

        uint tokenId = totalSupply() + 1;

        _mint(msg.sender, tokenId);

        payable(owner()).transfer(msg.value);
    }

    // function batchMintNFT(uint _amount) public {
    //     for(uint i = 0; i < _amount; i++) {
    //         mintNFT();
    //     }
    // }

    function tokenURI(uint _tokenId) public override view returns (string memory) {
        if(isRevealed == false) return notRevealedURI;

        return string(abi.encodePacked(metadataURI, '/', Strings.toString(_tokenId), '.json'));
    }

    function reveal() public onlyOwner {
        isRevealed = true;
    }

    function setWhiteList(address _whitelist, uint _amount) public onlyOwner {
        whitelist[_whitelist] = _amount;
    }

    function test() public view returns(uint) {
        return block.timestamp;
    }
}