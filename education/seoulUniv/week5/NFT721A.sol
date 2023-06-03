// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;


import "erc721a/contracts/ERC721A.sol";


contract BabyAlphaERC721A is ERC721A {
    constructor() ERC721A("Baby Alpha", "BABY ALPHA") {
    }

    function _baseURI() internal pure override returns (string memory) {
        return "";
    }

    function mint(uint quantity) public {
        _mint(msg.sender, quantity);
    }

    function _startTokenId() internal pure override returns (uint256) {
        return 1;
    }
}
