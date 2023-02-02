// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFT is ERC721Enumerable, Ownable {

  // 1. import "@openzeppelin/contracts/utils/Strings.sol"; 사용 코드
  using Strings for uint256;

  // 2. baseURI 담을 변수 선언
  string baseURI;

  // 3. baseURI 에서 tokenId 별 메타데이터에 접근하기 위한 .json 가 담긴 변수 선언
  string public baseExtension = ".json";

  // 4. minting 금액 선언 ( 에어드랍 기능을 위해서는 cost를 0으로 해야함 or 다른 아이디어 있을 시 추가 )
  // uint256 public cost = 0.05 ether;

  // 5. 최대 발핼량 maxSupply 변수 선언 
  uint256 public maxSupply = 80;

  // 6. 최대 민팅 가능 수량 maxMintAmount 변수 선언
  // uint256 public maxMintAmount = 20;

  // 7. 민팅 기능 활성화 여부를 결정 짓는 변수 
  bool public paused = false;

  // 8. 리빌 기능 활성화 여부를 결정 짓는 변수
  bool public revealed = false;

  // 9. 리빌 기능이 비활성화 되어있을 때 보여줄 메타데이터URI (pinata)
  string public notRevealedUri;

  // 10. 컨트랙트 처음 배포 시 입력 받을 초기 값 설정하는 constructor
  constructor(
    string memory _name,
    string memory _symbol,
    string memory _initBaseURI,
    string memory _initNotRevealedUri
  ) ERC721(_name, _symbol) {
    setBaseURI(_initBaseURI);
    setNotRevealedURI(_initNotRevealedUri);
  }


  // internal
  // 11. 10번에서 baseURI를 설정했기 때문에 이 함수 호출 시, 설정된 baseURI 리턴
  function _baseURI() internal view virtual override returns (string memory) {
    return baseURI;
  }

  // public
  // 12. 민팅 함수 ( airdrop 기능 추가해야 함 )
  function mint() public {
    // total supply
    uint256 supply = totalSupply();

    // minting available 여부
    require(!paused, "Now, minting is disabled");

    // 현재 total supply 값이 위에서 정해둔 최대 발행량 보다 높은 경우 minting 불가능 
    require(supply <= maxSupply, "No more mint.");

    uint tokenId = totalSupply() + 1;
    _mint(msg.sender, tokenId);
  }


  // 13. 지갑 별 보유한 NFT를 알아내는 함수로 추정
  // 13.1 : balanceOf로 몇개를 보유한 지 총 수량을 알아냄
  // 13.2 : 13.1의 값으로 해당 tokenId 가 소유하고 있는 메타데이터 값을 뽑아낸다
  function walletOfOwner(address _owner)
    public
    view
    returns (uint256[] memory)
  {
    uint256 ownerTokenCount = balanceOf(_owner);
    uint256[] memory tokenIds = new uint256[](ownerTokenCount);
    for (uint256 i; i < ownerTokenCount; i++) {
      tokenIds[i] = tokenOfOwnerByIndex(_owner, i);
    }
    return tokenIds;
  }

  // 14. 특정 tokenId 값이 보유한 (key) : 메타데이터 주소 (value) 뽑아냄
  // 14.1 : 만약 reveal기능이 비활성화 되어있다면, notRevealedUri로 리턴
  // 14.2 : 그렇지 않으면 baseURI 리턴 ( tokenId.json )
  function tokenURI(uint256 tokenId)
    public
    view
    virtual
    override
    returns (string memory)
  {
    require(
      _exists(tokenId),
      "ERC721Metadata: URI query for nonexistent token"
    );
    
    if(revealed == false) {
        return notRevealedUri;
    }

    string memory currentBaseURI = _baseURI();
    return bytes(currentBaseURI).length > 0
        ? string(abi.encodePacked(currentBaseURI, tokenId.toString(), baseExtension))
        : "";
  }

  //only owner
  // 15. reveal 기능 활성화 함수
  function reveal() public onlyOwner {
      revealed = true;
  }
  
  // 16. 민팅가격 설정 함수
  // function setCost(uint256 _newCost) public onlyOwner {
  //   cost = _newCost;
  // }

  // 17. 최대 민팅 가능 수량 설정 함수
  // function setmaxMintAmount(uint256 _newmaxMintAmount) public onlyOwner {
  //   maxMintAmount = _newmaxMintAmount;
  // }
  
  // 18. 민팅 기능 비활성화 일 때 리턴해주는 notRevealedUri 값 변경 함수
  function setNotRevealedURI(string memory _notRevealedURI) public onlyOwner {
    notRevealedUri = _notRevealedURI;
  }

  // 19. 민팅 기능 활성화일 때 리턴해주는 baseURI 값 변경 함수
  function setBaseURI(string memory _newBaseURI) public onlyOwner {
    baseURI = _newBaseURI;
  }

  // 20. .json 확장자명 값 변경 함수
  function setBaseExtension(string memory _newBaseExtension) public onlyOwner {
    baseExtension = _newBaseExtension;
  }

  // 21. 민팅 기능 멈추게 하는 함수
  function pause(bool _state) public onlyOwner {
    paused = _state;
  }
  
  // 22. 민팅 후 금액이 컨트랙트에 쌓이는데, 컨트랙트에 쌓인 금액을 인출하는 함수
  // 22.1 : owner가 withdraw() 호출 시, 컨트랙트에서 owner address 로 모두 전송
  function withdraw() public payable onlyOwner {
    // This will pay HashLips 5% of the initial sale.
    // You can remove this if you want, or keep it in to support HashLips and his channel.
    // =============================================================================
    // =============================================================================
    
    // This will payout the owner 95% of the contract balance.
    // Do not remove this otherwise you will not be able to withdraw the funds.
    // =============================================================================
    (bool os, ) = payable(owner()).call{value: address(this).balance}("");
    require(os);
    // =============================================================================
  }
}