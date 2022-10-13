// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ERC721r.sol";

contract RandomNft is ERC721r
{   // 만약 이걸로 하면 팩토리 컨트랙트는 어떻게 해야할까? A 연예인이 이 방식으로 minting을 하면, 이후에 추가될 연예인 NFT는??
    
    // constructor의 argument는 첫번째 name, symbol and maximum supply
    constructor () ERC721r("RandomNFT", "YGBS", 10000) {}

    function mint(uint256 quantity) external
    {   // mint 한번에 한번만 할 수 있다.
        require(quantity == 1, "you can mint only one at once");
        _mintRandom(msg.sender, quantity);
    }

    function reserver() external
    {   
        for(uint i = 1; i > 0; i--)
        {
            _mintAtIndex(msg.sender, i - 1);
        }
    }

    // 지금까지 이해한 바로는 먼저 ipfs://에 json 과 image 세팅을 해두고, 위의 mint() 로 임의의 tokenId 값으로 minting이 이루어지는 거 같은데, _baseURI는 어떻게 가져오는 것일까?
    function _baseURI() override internal view virtual returns(string memory)
    {
        return "ipfs://data.../4177.json";
    }
}