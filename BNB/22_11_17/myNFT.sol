// SPDX-License-Identifier: MIT
 
 pragma solidity ^0.8.7;

 import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
 import "@openzeppelin/contracts/utils/Strings.sol";

 contract MintNFT is ERC721Enumerable {
    // mapping(uint => string) public metadataURIs;
    string public metadataURI;
    uint constant public TOTAL_NFT = 100;

    constructor(string memory _metadataURI) ERC721("BNB Chanllener", "BC") {
        metadataURI = _metadataURI;
    }

    function mintNFT() public {
        require(TOTAL_NFT > totalSupply(), "No more mint.");

        uint tokenId = totalSupply() + 1;

        _mint(msg.sender, tokenId);
    }

    function batchMint(uint _amount) public {
        for(uint i = 0; i < _amount; i++) {
            mintNFT();
        }
    }
    
   // function setTokenURI(uint _tokenId, string memory _metadataURI) public {
   //     metadataURIs[_tokenId] = _metadataURI;
   // }

    function tokenURI(uint _tokenId) public override view returns(string memory) {
        // return metadataURIs[_tokenId];
        return string(abi.encodePacked(metadataURI, '/', Strings.toString(_tokenId), '.json'));
    }
 }