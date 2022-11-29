// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/access/Ownable.sol";
import "MintNFT.sol";

contract Sale is Ownable {
    address mintAddress;
    MintNFT mintContract;

    mapping(uint => uint) public tokenPrices;

    constructor(address _mintAddress) {
        mintAddress = _mintAddress;
        mintContract = MintNFT(_mintAddress);
    }

    function setForSale(uint _tokenId, uint _price) public  {
        address tokenOwner = mintContract.ownerOf(_tokenId);

        require(tokenOwner == msg.sender, "Not owenr.");
        require(_price > 0, "Price zero.");
        require(tokenPrices[_tokenId] == 0, "already sale.");
        require(mintContract.isApprovedForAll(tokenOwner, address(this)), "Not approved.");

        tokenPrices[_tokenId] = _price * 10 ** 18;
    }

    function purchase(uint _tokenId) public payable {
        uint price = tokenPrices[_tokenId];
        address tokenOwner = mintContract.ownerOf(_tokenId);

        require(price > 0, "not sale.");
        require(price <= msg.value, "more bnb.");
        require(tokenOwner != msg.sender, "owner not buy.");

        

        // payable(owner()).tranfer(100);
        payable(tokenOwner).transfer(msg.value);
        mintContract.safeTransferFrom(tokenOwner, msg.sender, _tokenId);

        tokenPrices[_tokenId] = 0;
    }
}