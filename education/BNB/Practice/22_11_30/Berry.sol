// SPDX-License-Identifier : MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// Tree contract import
import './Tree.sol';

// Berry Contract : ERC20
contract Berry is ERC20, Ownable {
    address treeAddress;
    Tree treeContract;

    // ERC20 name, symbol 지정
    constructor() ERC20("TMI Berry", "TB") {}

    function bearBerry(uint _treeId) public {
        // treeContract(721)이 tokenId==_treeId로 조회한 address와 msg.sender를 비교하는 코드
        require(treeContract.ownerOf(_treeId) == msg.sender, "Caller is not tree NFT owner");

        // tokenId==_treeId로 조회한 유저가 가진 bearTime과 bearBerry를 호출한 시간과 비교하는 코드
        require(treeContract.getBearTime(_treeId) < block.timestamp, "you are not ready to bear");

        // 위의 require문을 모두 충족하면, msg.sender에게 NFT가 보유한 berryAmount만큼 ERC20 berry를 주는 코드
        _mint(msg.sender, treeContract.getBerryAmount(_treeId) * 10**18);

        // 그리고 다시 1분을 추가 해줌 -> 수확 (harvest) 는 1분에 한번씩 가능한 것으로 추정
        treeContract.setBearTime(_treeId, block.timestamp + 60);
    }

    // 처음에 배포할 때는 constructor로 지정하는게 아니라 owner만이 다시 setTreeContract를 통해 지정해줄 수 있다.
    function setTreeContract(address _treeAddress) public onlyOwner {
        treeAddress = _treeAddress;
        treeContract = Tree(_treeAddress);
    }

    // Tree contract에서만 burnBerry 함수를 호출할 수 있다.
    // parameter로 전달받은 _treeOwner가 보유한 _amount를 소각한다.
    function burnBerry(address _treeOwner, uint _amount) public {
        require(treeAddress == msg.sender, "U are not Tree");
        _burn(_treeOwner, _amount);
    }
}