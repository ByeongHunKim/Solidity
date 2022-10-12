# 질문

## 1. customInterface는 뭔지

## 2. interfaces/ 그리고 utils/ 는 import하지 않기 위해서 사용할 것들을 미리 세팅해둔 것으로 이해했는데, 다른게 더 필요하면 어디서 구함?

## 3. NFT.sol 질문

### 3.1 `event WithDraw(address indexed sender, uint256 time, uint256 value);` 에서 `indexed`의 의미
### 3.2 init() 에서 `calldata`의 의미
### 3.3 getRandom() 을 실행시켜볼라했는데 안됨 이유뭐임?
### 3.4 _burn이 뭐임?

## 4. Factory.sol 질문
### 4.1 // 이후 처음에 배포한 NFT Contract는 버림 이 부분 이해 안감. 버리면 안됨. 그러면 한명씩만 민팅이 가능하다는 거 아님? 

### 4.2 addCompany() 에서 onlyOwner가 ownable 상속받은 함수 사용한 거 같은데, 의미를 모르겠음
### 4.3 createNewNFT() 에서 onlyCompany 붙인이유 , INFT, `.init()` , push는 이해했음
### 4.4 _createClone() 전혀 모르겠슴 
