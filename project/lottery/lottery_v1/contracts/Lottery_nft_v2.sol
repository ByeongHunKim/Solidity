// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts@4.4.2/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.4.2/access/Ownable.sol";
import "@openzeppelin/contracts@4.4.2/utils/Counters.sol";
import "@openzeppelin/contracts@4.4.2/utils/Strings.sol";

contract MyToken is ERC721, Ownable {

    // 결과 : reveal true/false 여부에 따라 값이 변경되긴하는데, 이미 발행된 NFT는 값이 변경된게 확인이 되어도, 이미지가 달라지지 않는다.

    // baseURI는 reveal되기 전 rust이미지.

    // reveal 시키려면 1. changeBaseURI(NFT메타데이터로) 2. changeRevealed(true)

    // 이미지 바뀐 것 확인

    // 추가 : 랜덤값으로 지정해줘야하는데 어떻게 할지..
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    string public baseURI = "ipfs://QmUsjyVGzbSSrtdPYNFa61KAxDhrCV4ZgPqJbaVDWkcUXg/";
    bool public revealed = false;

    constructor() ERC721("LotteryNFT", "YGBS") {}

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }

    function changeBaseURI(string memory baseURI_) public onlyOwner {
        baseURI = baseURI_;
    }

    function changeRevealed(bool _revealed) public onlyOwner {
        revealed = _revealed;
    }

    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId + 1);
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");

        string memory baseURI_ = _baseURI();

        if (revealed) {
            // toString(tokenId)이거 대로 가 아니라, mapping (uint256 => uint256) tokenMetadataNo; 에 저장되어있는 랜덤값으로 변경 
            return bytes(baseURI_).length > 0 ? string(abi.encodePacked(baseURI_, Strings.toString(tokenId), ".json")) : "";
        } else {
            return string(abi.encodePacked(baseURI_, "40.json"));
        }
    }
}