# Shopang💹
<p align="center">
</p>
<h3 align="center"><strong>간단한 쇼핑몰 프로젝트</strong></h3>


- **프로젝트명** : Shopang

<br/>

# 목차 📚
- <a>프로젝트 소개</a>
- <a>기술 스택
- <a>ERD
- <a>주요 기능
- <a>후기</a>

<br/>
<br/>

# 프로젝트 소개 🔎

- 로그인, 회원가입이 구현
- crud기능으로 간단한 쇼핑몰, 장바구니 구현
- Spring security기능으로 관리자기능 구현

  
  <br/>
  <br/>



<br/>
<br/>

# 기술 스택 ⚙

## Frotend
![image](https://github.com/user-attachments/assets/59519084-0a14-45c5-8fb3-9219e600b6bf)

<br/>

## Backend
![image](https://github.com/user-attachments/assets/b5d04cd3-548f-4b6c-8443-ad512e63186c)

<br/>

## Tools, Cooperation
![image](https://github.com/user-attachments/assets/3c58014d-d840-4544-a698-91b05ca026fc)

<br/>

## Server
![image](https://github.com/user-attachments/assets/751b65cd-cdb2-4ab6-a3a7-b3b4627cd8eb)

<br/>

## DB
![image](https://github.com/user-attachments/assets/0cf6b563-bfd7-400f-969f-30c77731bb6d)

<br/>

## Skills or API
![kakaoMap](https://github.com/user-attachments/assets/8e3a95ec-11aa-4c78-ada1-5140860cd39d)


<br/><br/>

# ERD 📝
![image](https://github.com/user-attachments/assets/8181cd50-56da-4d94-baa9-6b02487818be)

<br/><br/>
# 주요 기능 💵

- **메인 페이지**
  ![image](https://github.com/user-attachments/assets/a2bf713d-15a6-45e4-8d37-b5a105140ba6)
  

  - 헤더, 푸터를 배치했으며 간단한 글귀와 로그인, 회원가입, 상품목록 버튼을 구현했습니다.
  - 헤더 가운데 로고글씨를 누르면 메인페이지로 이동합니다.
 
  <br/>
  <br/>

- **회원가입**
 ![image](https://github.com/user-attachments/assets/49219a87-3951-470f-99de-61e416a314f9)
 ![image](https://github.com/user-attachments/assets/180ef1f7-c03f-458b-a744-47d461d10325)
 ![image](https://github.com/user-attachments/assets/166b8754-5f7c-4899-9b1e-8b9368f0d315)




  - 회원가입 시 DB에 유저정보가 등록됩니다.<br/>
  - 아이디 중복검사를 구현했습니다
  - 비밀번호 보기/가리기 버튼을 구현했습니다
  - 아이디, 비밀번호, 별명, 이름에 유효성검사를 추가했습니다
  - 카카오맵API를 이용해 주소검색을 추가했습니다
  <br/>
  <br/>

  
- **로그인**
![image](https://github.com/user-attachments/assets/c7875d88-4344-40f1-b2d2-36194d15d2c2)

  - ID / PW를 입력해 로그인을 합니다.
  - 아이디 저장, 자동 로그인 기능을 지원해 사용자 편의성을 높였습니다.
 
  <br/>
  <br/>
  
- **마이 페이지**
  - 정보 수정, 비밀번호 변경, 회원 탈퇴를 진행 할 수 있습니다.<br>
  ![image](https://github.com/user-attachments/assets/76b293c9-bbb2-477d-95fa-e18d29037cce)
  ![image](https://github.com/user-attachments/assets/93e22380-9b3a-4578-8323-4f9284ea5794)
  ![image](https://github.com/user-attachments/assets/7ee92ecf-65f9-46e2-9213-eb22840275bb)
 
 - 아이디를 제외한 정보 수정, 탈퇴를 구현했습니다. 



  <br/>
  <br/>

- **제품,장바구니 페이지**
  ![image](https://github.com/user-attachments/assets/bd136d83-741e-4e64-b4e9-a5c0493c8cbd)
  ![image](https://github.com/user-attachments/assets/54521309-f859-4372-bfea-bee78faed5df)
  ![image](https://github.com/user-attachments/assets/1b0884d8-733a-4f9f-8841-31f3b4db49ad)



  - 상품을 담기버튼으로 장바구니에 추가할 수 있습니다.
  - 장바구니에서 구매,삭제를 구현했습니다
  - 구매를 하면 완료페이지로 이동하며 메인페이지로 이동하는 버튼을 추가했습니다.
  

  <br/>
  <br/>
  


- **관리자 페이지**
  - 회원관리, 계정권한 관리, 게시판 관리, 환율 업데이트 기능을 지원합니다.<br>
    
    

<br/>
<br/>

# 후기 🧐
- 이원빈 : Java, Spring, HTML, CSS, JS, AJAX 등 웹 개발에 필요한 기술을 사용하면서 기술의 이해도를 높인 점이 좋았습니다. 특히 해당 웹페이지를 구현하면서 환율 공공데이터 API의 지원 통화의 한계점과 고시회차 정보를 지원하지 않아 어려움을 겪었지만 웹 크롤링과 스프링 스케줄러를 통해 API를 대체했던 점이 뿌듯하고 좋았습니다.<br/><br/>
- 김정호 : CRUD 작업, 구글 차트, 웹 크롤링, 네이버 POP3/SMTP, 쿨에스엠에스 API 등 다양한 기술을 활용해 여러 기능을 구현한 점이 매우 만족스러웠습니다.
수많은 시행착오를 겪었지만, 팀원들과 적극적으로 소통하며 문제를 빠르게 파악하고 해결한 경험이 큰 도움이 되었습니다. 또한, 모르는 부분이 있을 때 서로 질문하고 대화하면서 부족한 부분을 보완해 나간 점도 의미 있는 경험이었습니다. <br/><br/>
- 최현웅 : 실제 은행에서 사용하는 API를 활용하지 못해 데이터의 디테일이 부족했던 점이 아쉬웠습니다. 그럼에도 불구하고 웹사이트의 완성도가 떨어져 보일 수 있지만, 제한된 조건 속에서 대체할 수 있는 방법을 찾아가며 계획한 핵심 기능들이 잘 구현된 것에 만족합니다. 특히 CRUD 작업에 대한 이해도가 높아졌고, 웹 크롤링, API, 웹소켓 등 여러 기술을 활용해볼 수 있는 경험이 매우 유익했습니다. <br/><br/>
- 함지훈 : 관리자 권한에서 계정 및 게시물 삭제와 활성화 설정 기능을 추가해 효율적인 관리가 가능하게 했고, API를 활용해 외부 통신에 대한 개념을 확립한 점을 긍정적으로 평가했습니다. 하지만 마이페이지 디자인이 허전하게 느껴지고, 환율 관련 추가 관리자 기능이 부족한 점은 추후 개선할 예정입니다.

<br/><br/>
