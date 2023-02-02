// SPDX-License-Identifier: MIT
 
 pragma solidity ^0.8.7;

 import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
 import "@openzeppelin/contracts/utils/Strings.sol";
 import "@openzeppelin/contracts/access/Ownable.sol";

 contract MintNFT is ERC721Enumerable, Ownable {
    string public metadataURI;
    uint constant public TOTAL_NFT = 100;
    string public notRevealedURI;
    bool public isRevealed = false;


    constructor(string memory _metadataURI, string memory _notRevealedURI) ERC721("BNB Chanllener", "BC") {
        metadataURI = _metadataURI;
        notRevealedURI = _notRevealedURI;
    }

    function mintNFT() public onlyOwner {
        require(TOTAL_NFT > totalSupply(), "No more mint.");

        uint tokenId = totalSupply() + 1;

        _mint(msg.sender, tokenId);
    }

    function batchMint(uint _amount) public {
        for(uint i = 0; i < _amount; i++) {
            mintNFT();
        }
    }

    function tokenURI(uint _tokenId) public override view returns(string memory) {
        if(isRevealed == false) return notRevealedURI;
        return string(abi.encodePacked(metadataURI, '/', Strings.toString(_tokenId), '.json'));
    }
    
    function reveal() public onlyOwner {
        isRevealed = true;
    }
 }