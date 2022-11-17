// SPDX-License-Identifier : MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract MintNFT is ERC721Enumerable{

    constructor() ERC721("RandomNFT", "YGBS") {}

    // _mint함수가 ERC721Enumerable에 존재하기 때문에 import해도 사용할 수 있다. _mint() 는 internal
    // ERC721Enumerable에 totalSupply() 가 있다. 이 프로젝트의 NFT 의 총 개수를 return -> minting할 때 tokenId값으로 사용 가능.
    function mintNFT() public {
        uint tokenId = totalSupply() + 1; // 첫번째 NFT의 tokenId는 0이 아니다.
        _mint(msg.sender, tokenId);
    }
    
}