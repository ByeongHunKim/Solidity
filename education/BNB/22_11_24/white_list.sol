// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MintNFT is ERC721Enumerable, Ownable {
    uint constant public TOTAL_NFT = 100;
    string public metadataURI;
    string public notRevealedURI;
    bool public isRevealed;
    mapping(address => uint) whitelist;

    constructor(string memory _metadataURI, string memory _notRevealedURI) ERC721("BNB,Challenger", "BC") {
        metadataURI = _metadataURI;
        notRevealedURI = _notRevealedURI;
    }

    function mintNFT() public payable {
        require(TOTAL_NFT > totalSupply(), "No more mint.");
        require(whitelist[msg.sender] > 0, "Not whitelist.");
        require(msg.value >= 0.1 ether, "value is not enough");

        uint tokenId = totalSupply() + 1;
        _mint(msg.sender, tokenId);
        whitelist[msg.sender]--; // whitelist[msg.sender] = whitelist[msg.sender] - 1;
        payable(owner()).transfer(msg.value);
    }

    function batchMintNFT(uint _amount) public {
        for(uint i = 0; i < _amount; i++) {
            mintNFT();
        }
    }

    function tokenURI(uint _tokenId) public override view returns (string memory) {
        if(isRevealed == false) return notRevealedURI;

        return string(abi.encodePacked(metadataURI, '/', Strings.toString(_tokenId), '.json'));
    }

    function reveal() public onlyOwner {
        isRevealed = true;
    }

    function setWhitelist(address _whitelist, uint _amount) public onlyOwner {
        whitelist[_whitelist] = _amount;
    }
}