## 기타
- public 과 external 에 대해서..
  - external로 하는게 함수의 역할에 대해서도 인식하기 편하고 가스비도 public보다 저렴함

- context가 연결되는게, erc20 - bep20 토큰 규격을 따른다.
  - 오늘 배우는 Transfer event를 나는 listening하고 있다 

## 복슴

## (1) erc20 transfer
## (2) erc20 transferFrom, approve
    - approve
    - allowance에 저장 ( 얼마만큼 누구에게 권한이 있다 ) owner, spender -> output uint
    - transferFrom 요청 시 allowance mapping에 저장된 값 사용
      - 권한을 주면 유니스왑이 내 토큰을 알아서 가져간다
        - 권한을 주는게 approve
## (3) WETH
    - 왜 이걸 쓰냐에 대한 이야기가 있다
        - uniswap에서는 무조건 이더리움을 페어로 풀을 생성했는데, 그 때는 다른 토큰으로 스왑을 하려고하면 두번 거쳤다
        - 위 내용이 불편했고, v2에서는 transferFrom 기능이 있는 WETH를 사용하게 되었다
        - native ETH는 transferFrom이 없음

## 수업 메모
```markdown
1. name
2. symbol
3. decimals
4. totalSupply
5. balanceOf
6. transfer
    1. 1) 예외, 2) 데이터 변경, 3) 이벤트 emit, 4) return true
7. transferFrom
8. approve
9. allowance

- Transfer Event → transfer(), transferFrom()
- Approval Event → appove()

- weth 기능 추가
    - deposit ( eth to WETH Token )
    - withdraw ( WETH Token to eth )
```