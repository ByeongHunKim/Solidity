
// SPDX-License-Identifier : MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract LotteryNFT is ERC721, Ownable {
    using Strings for uint256;

    uint256 MAX_SUPPLY = 45;
    bool isSaleActive = true;
    uint256 totalSupply;
    string public baseExtension = ".json";

    /*
        mapping 변수를 만들어서 각 토큰마다 어떤 메타데이터를 넣을지 저장하는 변수 생성
        tokenMetadataNo mapping 변수에는 key 값으로는 tokenId, value 값으로는 tokenId의 1부터 45까지 어떤 메타데이터를 지급할 지 n.json에서 n 값이 들어간다.
        민팅이될 때 tokenId값에 메타데이터를 넣어줘야하는데, 이 값이 랜덤값이 되게 된다.
    */

    mapping (uint256 => uint256) tokenMetadataNo;

    constructor() ERC721("LotteryNFT", "YGBS") {}

    function _baseURI() internal view override returns (string memory) {
        // https://ipfs.io/ipfs/QmUsjyVGzbSSrtdPYNFa61KAxDhrCV4ZgPqJbaVDWkcUXg/46.json
        return "ipfs://QmUsjyVGzbSSrtdPYNFa61KAxDhrCV4ZgPqJbaVDWkcUXg/";
    }

    function setSale(bool active) external onlyOwner {
        isSaleActive = active;
    }

    function mint(uint256 count) external payable {
        require(isSaleActive, "not on sale period");
        require(msg.value >= 10000000000000000 * count, "you have to pay 0.01 ETH");
        require(count <= 10, "mint maximum 10 nfts at once");

        for(uint i = 0; i < count; i++) {
            require(totalSupply < MAX_SUPPLY, "max supply exceeded");
            tokenMetadataNo[totalSupply] = 
                1 + 
                (uint256(blockhash(block.number)) % MAX_SUPPLY);
            _safeMint(msg.sender, totalSupply++);
        }
    }
    
    function tokenURI(uint256 tokenId) public view virtual override returns(string memory) {
        _requireMinted(tokenId);

        string memory baseURI = _baseURI();
        return string(abi.encodePacked(baseURI, tokenMetadataNo[tokenId].toString(),baseExtension));
    }

    function withdraw() external onlyOwner {
        payable(msg.sender).transfer(address(this).balance);
    }
}