// SPDX-License-Identifier : MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

import './Berry.sol';

contract Tree is ERC721Enumerable, Ownable {

    // Tree NFT의 정보를 정의한 struct? 
    struct TreeData {
        uint level;
        string color;
        string shape;
        uint berryAmount;
        uint exp;
        bool isMaxLevel;
    }

    // trees mapping에는 무엇이 담기는가?
    mapping(uint => uint) trees;

    // 위에 선언한 struct의 정보를 저장할 매핑? 
    mapping(uint => TreeData) treeData;
    
    // bearTime의 의미는 무엇인가?
    mapping(uint => uint) bearTime;

    // Tree NFT의 metadataURI (pinata?)
    string metadataURI;

    // address type의 berryAddress 변수 선언
    address berryAddress;

    // Berry type의 berryContractaddress를 저장한 변수 선언
    Berry berryContract;

    // treeDataId로 데이터를 관리 n번째 dataId별로 위에 선언한 struct별로 다른 정보를 가지고 있다(라는 가정?)
    uint public treeDataId;

    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) {}

    // modifier 선언하여 함수키워드로 사용
    modifier treeOwner(uint _tokenId) {
        require(ownerOf(_tokenId) == msg.sender, "you are not a tree owner");
        _;
    }

    function mintTree(uint _treeDataId) public onlyOwner {
        require(treeData[_treeDataId].berryAmount > 0, "Not exist tree.");
        require(treeData[_treeDataId].level == 1, "Not level 1.");

        uint tokenId = totalSupply() + 1;

        trees[tokenId] = _treeDataId;

        _mint(msg.sender, tokenId);
    }

    function setTreeData(string memory _color, string memory _shape, uint[] memory _berryAmount, uint[] memory _exp) public onlyOwner {
        require(_berryAmount.length == _exp.length, "input is wrong");
        require(_exp[_exp.length -1] == 0, "max level tree is exp not 0.");

        for(uint i = 0; i < _berryAmount.length; i++) {
            treeDataId++;
            // TreeData (level, color, shape, berryAmount, exp, isMaxLevel)
            treeData[treeDataId] = TreeData(i + 1, _color, _shape, _berryAmount[i], _exp[i] * 10 **18, false);

            // 배열의 마지막 값을 알아내기 위해서 length -1 한 것으로 추정
            // i 값이 배열의 마지막 값 까지 도달했을 때 stop 하려는 코드로 추정
            if(i == _berryAmount.length - 1) {
                 treeData[treeDataId].isMaxLevel = true;
            }
        }
    }

    // parameter로 입력받은 metadataURI를 새로 지정
    function setTokenURI(string memory _metadataURI) public onlyOwner {
        metadataURI = _metadataURI;
    }

    // Tree NFT 의 tokenId 를 parameter에 실어서 함수를 호출했을 때 해당 tokenId NFT가 가진 정보를 리턴해주는 함수?
    function tokenURI(uint _tokenId) public override view returns(string memory) {
        uint _treeDataId = trees[_tokenId];

        uint level = treeData[_treeDataId].level;

        string memory color = treeData[_treeDataId].color;
        
        string memory shape = treeData[_treeDataId].shape;

        return string(abi.encodePacked(metadataURI, '/', shape, '/', color, '/', Strings.toString(level), '.json'));
    }

    // 1. NFT의 tokenId를 parameter에 실어서 함수 호출
    // 2. treeDataId를 알기 위해서 trees 매핑에 tokenId를 넣고 _treeDataId 변수에 값을 담는다.
    // 3. 해당 tokenId가 보유한 berryAmount를 알기 위해서 2번에서 얻은 treeData에 접근해 berryAmount값을 얻는다.
    // 4. 얻은 berryAmount값을 리턴
    // 5. (생각 : berryAmount -> ERC20 -> burn 시 ERC20을 얻고, berryAmount는 다시 초기화 또는 burn 한 만큼 차감
    function getBerryAmount(uint _tokenId) public view returns(uint) {
        uint _treeDataId = trees[_tokenId];

        uint _berryAmount = treeData[_treeDataId].berryAmount;

        return _berryAmount;
    }

    // bear의 정확한 의미를 모르겠다.
    // 이 컨트랙트와 인터랙션하는 프론트에서는 이미 berryContract CA 주소를 알고 있을 것 같다.
    // 아니면 이 함수를 호출할 때 msg.sender가 상속받은 berryContract CA 주소 였던 것.
    function setBearTime(uint _tokenId, uint _bearTime) public {
        require(berryAddress == msg.sender, "you are not Berry");

        bearTime[_tokenId] = _bearTime;
    }

    // 특정 tokenId 별로 다른 bearTime을 가지고 있는 것으로 추정
    // 왜 달라야만 하는가?
    function getBearTime(uint _tokenId) public view returns(uint) {
        return bearTime[_tokenId];
    }

    // constructor로 상속받은 컨트랙트 CA주소를 넣지 않기 때문에, 배포할 때는 문제없이 되고,
    // 이후에 이 함수를 통해 berryContract를 상속받는 느낌인 것으로 추정
    // berryContract에도 _berryAddress를 Berry로 감싼 이유는, berryContract의 함수를 사용하기 위함인 것으로 추정
    function setBerryContract(address _berryAddress) public onlyOwner {
        berryAddress = _berryAddress;
        berryContract = Berry(_berryAddress);
    }

    function levelUp(uint _tokenId) public treeOwner(_tokenId) {
        uint _treeDataId = trees[_tokenId];

        // 해당 NFT가 가진 isMaxLevel 속성이 false 즉, 아직 최대치가 아니여야만 한다는 조건
        require(!treeData[_treeDataId].isMaxLevel, "your Tree NFT has maxLevel");
        
        // 왜 exp가 balanceOf 인지 모르겠다. berry ERC20이 즉 exp인거고 모으면 소각시키고 levelUp을 하는 구조인가? 
        require(treeData[_treeDataId].exp <= berryContract.balanceOf(msg.sender), "Not enough berry");
        

        // burnBerry 함수가 두개의 parameter를 받는 것 같다.
        berryContract.burnBerry(msg.sender, treeData[_treeDataId].exp);
        
        // level을 1 올려줘야하는 것 아닌가?
        trees[_tokenId] = _treeDataId + 1;
    }




}