pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MintNFT is ERC721Enumerable, Ownable {

    string public metadataURI; // 리빌 후
    string public notRevealedURI; // 리빌 후 
    uint public totalNFT;
    bool public isRevealed;

    constructor(string memory _notRevealedURI, uint _totalNFT) ERC721("BNB Challenger", "BC") {
        notRevealedURI = _notRevealedURI;
        totalNFT = _totalNFT;
    }

    function mintNFT() public onlyOwner {
        require(totalNFT > totalSupply(), "No more mint");

        uint tokenId = totalSupply() + 1;
        _mint(msg.sender, tokenId);
    }

    function batchMint(uint _amount) public {
        for(uint i = 0; i < _amount; i++) {
            mintNFT();
        }
    }

    function setTokenURI(string memory _metadataURI) public onlyOwner {
        metadataURI = _metadataURI;
    }


    // abi.encodePacked() -> 인자를 하나로 합쳐주는 기능
    function tokenURI(uint _tokenId) public override view returns (string memory) {
        if(isRevealed == false) return notRevealedURI;

        return string(abi.encodePacked(metadataURI, '/', Strings.toString(_tokenId), '.json'));
    }

    function reveal() public onlyOwner {
        isRevealed = true;
    }
}