// SPDX-License-Identifier : MIT
pragma solidity ^0.8.15;

contract Lottery{
  
  address public owner;

  address payable[] public players;

  // Lottery 회차에 대해서 winner를 기록하고 싶기 때문에, 회차의 데이터를 가질 변수 선언. 초기값은 0
  uint256 public lotteryId;

  // 해당 lotteryId에 대해서 누가 winner(players[index])였는지 address를 기록 그럼 1회차에 당첨 address 한개 씩 들어감.
  mapping(uint256 => address) public lotteryHistory;

  constructor(){
  // 이 컨트랙트를 배포하는 주소가 owner가 된다는 의미
    owner = msg.sender;
  }

  // address(this) : Lottery 컨트랙트의 주소 (CA) , 즉 이 컨트랙트가 가지고 있는 총 ETH Balance
  function getBalance() public view returns (uint256) {
    return address(this).balance;
  }

  /*
    getPlayers() 는 이번 lottery 회차에 참여한 모든 player의 주소 배열을 리턴하는 함수이다.
    누가 참여했는지를 볼 수 있는 view 함수이다

    이 내용을 읽어서 리턴을 하고자 할 때는 memory 값으로 리턴값에 적어줘야 한다
    적어주지 않으면 player값은 storage에 저장되어있기 때문에, storage에 있는 내용을 memory에 복사를 해와서 리턴을 해준다
  */
  function getPlayers() public view returns(address payable[] memory) {
    return players;
  }


  /*
    1. public payable function : enter() 는 참여자들로부터 ETH를 전송받을 목적의 함수이므로 payable 키워드가 붙어야한다

    2. require(msg.value >= .01 ether, "") : enter() 를 호출한 address가 전송한 ETH value가 0.01ETH 이상이어야만 컨트랙트를 호출할 수 있다. 미만인 경우에는 transaction이 revert 처리가 된다

    3. players.push(payable(msg.sender)) : msg.sender는 address 타입이다(컨트랙트를 호출한 주소). address payable 타입의 배열인 players에 저장하려면 payable 타입으로 converting이 필요하다
  */
  function enter() public payable{
    require(msg.value >= .01 ether, "you must pay more than 0.01 ETH");
    players.push(payable(msg.sender));
  }

  function getRandomNumber() public view returns (uint256) {
    return uint256(keccak256(abi.encodePacked(owner, block.timestamp)));
    /*
    abi.encodePacked(owner,block.timestamp) : owner와 block.timestamp 각각을 bytes로 converting 한 값을 concat(이어붙힌)한 값
    이를 keccak256 해시 알고리즘으로 해시한 값.
    이를 uint256 으로 converting(치환) 한 값이 랜덤값이 된다.
    */
  }
  
  function getRandomNumberV2() public view returns (uint256) {
    return uint256(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players)));
  }

  function getRandomNumberV3() public view returns (uint256) {
    return uint256(keccak256(abi.encodePacked(blockhash(block.number -1), block.timestamp)));
  }

  /*
    1. onlyOwner modifier : pickWinner()는 컨트랙트 배포자만 호출을 할 수 있게 제한하는 역할
    - 그냥 해당 함수에서 require문으로 해도 되지만, 다른 함수에서 사용이 될 수 있는 확률이 크면 코드의 재사용성을 높여주기 위함이다.
    - modifier 에서 _;의 의미 : modifier를 사용한 함수에 대해서 항상 modifier의 require문을 먼저 수행한 후 함수의 body부분을 실행하겠다는 의미이다.

    2. index = getRandomNumber() % player.length : random 값을 참여한 players 수로 나눈 나머지
    - 즉, 참여한 players 중에 랜덤하게 뽑겠다는 의미이다.
    - advanced : % player.length 이 값을 변수로 하게 되면 random값에 대한 range를 설정할 수 있을 것 같다.

    3. players[index].call{value:address(this).balance}("")} : 랜덤하게 뽑힌 player에게 컨트랙트의 모든 ETH를 전송
    - 2번에서 index값이 곧 랜덤 값이 되기 때문에 range가 아마 0~ players.length가 될 것이다.
    - 그러면 players[index]가 되면 배열의 몇번째 지갑주소인 유저가 당첨이 되었는지 확인할 수 있다. 

    4. players = new address payable[](0) : 당첨금을 지급한 후 다음 회차를 위해 이번 회차의 참여자가 등록되어있는 players 배열 초기화
    - 해당 배열에 대해 length를 0으로 바꿔주겠다는 의미이다.
  */

  function pickWinner() public onlyOwner{
    uint index = getRandomNumber() % players.length; // 모듈러 연산?

    // 모든 상태값을 변경하는 구문은 이렇게 이더를 전송하는 구문 앞에 적어주는게 좋다.
    // 이더를 보내는 구문이기도 하지만, 다른 곳을 호출하는 구문이기도 하다. players[index] 가 사용자의 지갑(EOA)일수도 있지만,  contract 주소일 수 도 있다. contract 주소일 때는 악의적으로 pickWinner함수를 계속 돌릴수가 있다. 
    // 재진입 공격을 방지하지 위해서 다른 컨트랙트와 인터랙션할 수 있는 앞 쪽에 모든 상태값을 변경해주는 습관을 들이는 게 좋다.
    
    lotteryHistory[lotteryId] = players[index];
    lotteryId++;

    /*
      players[index] : winner의 address
      (bool success, ) : 먼저 success에 ,가 붙은건 데이터가 들어가긴하는데 없어서 그냥 ,만 해준것 + players[index].call{value: address(this).balance}(""); 이 값이 boolean 값을 리턴한다 
      이렇게 이더를 전송해주는 구문이 성공/실패했는지 에 대해서 bool 값이 리턴되니까 성공이 되었는지 require문으로 체크를 해주는게 좋다.
    */
 
    (bool success, ) = players[index].call{value: address(this).balance}("");
    require(success, "Fail to send Ether to Winner");

    // 0인 사이즈의 address payable 배열을 생성해서 players에 저장
    // address payable[] public players; 로 이미 위에 선언되어있기 때문에, pickWinner 함수에서 players 변수 사용 가능.
    players = new address payable[](0);
  }

  modifier onlyOwner {
    require(msg.sender == owner, "you're not an contract owner");
    _;
  }
}