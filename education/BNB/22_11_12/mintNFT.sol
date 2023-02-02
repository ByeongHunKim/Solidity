// SPDX-License-Identifier : MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract MintNFT is ERC721Enumerable{

    mapping(uint => string) public metadataURIs;

    constructor() ERC721("RandomNFT", "YGBS") {}

    // _mint함수가 ERC721Enumerable에 존재하기 때문에 import해도 사용할 수 있다. _mint() 는 internal
    // ERC721Enumerable에 totalSupply() 가 있다. 이 프로젝트의 NFT 의 총 개수를 return -> minting할 때 tokenId값으로 사용 가능.
    function mintNFT() public {
        uint tokenId = totalSupply() + 1; // 첫번째 NFT의 tokenId는 0이 아니다.
        _mint(msg.sender, tokenId);
    }

    function setTokenURI(uint _tokenId, string memory _metadataURI) public {
        metadataURIs[_tokenId] = _metadataURI;
    }

    // override는 상속받을 때 사용한다. 부모와 다른 기능을 사용할 때 명시하면 된다. + 상속해주는 부모함수에는 virtual 명시.
    // view는 블록체인 네트워크에 기록하지 않는다. 이 함수는 읽기 전용 함수이다.
    function tokenURI(uint _tokenId) public override view returns(string memory) {
        return metadataURIs[_tokenId];
    }
    
}