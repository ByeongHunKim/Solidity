// SPDX-License-Identifier : MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract MintNFT is ERC721Enumerable {

    // 메타데이터를 관리할 변수(매핑)
    mapping(uint => string) metadataURIs;

    constructor() ERC721("BNB Challenger", "BC") {}

    function mintNFT() public {
        uint tokenId = totalSupply() + 1;
        _mint(msg.sender, tokenId);
    }

    function burnNFT(uint _tokenId) public {
        // burn 함수를 실행하는 사람이 주인인지 체크
        require(msg.sender == ownerOf(_tokenId), "Not Owner.");
        _burn(_tokenId);
    }

    // 메타데이터를 등록하는 함수
    function setTokenURI(uint _tokenId, string memory _metadataURI) public {
        metadataURIs[_tokenId] = _metadataURI;
    }

    // 메타데이터를 읽어오는 함수 (tokenURI)
    function tokenURI(uint _tokenId) public override view returns (string memory) {
        return metadataURIs[_tokenId];
    }
}

