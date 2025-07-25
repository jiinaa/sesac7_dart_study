# 네트워크

## 고수준(추상화된 방식), 저수준(직접 raw socket)
- 고수준: 빠르게 개발, 코드 간결함, 개발자 친화적
- 저수준: 복잡하지만 강력한 제어 가능

## 프로토콜
- 프로토콜: 서버와 클라이언트가 무슨 방식으로 대화할지 정해주는 것
- 다양한 프로토콜: FTP, DNS, SSH, WebSocket...

## URL
- URI: 모든 자원을 식별할 수 있는 통합 개념
- URL: 리소스의 위치를 알려줌 = 접속 가능한 경로(반드시 프로토콜 포함)
- URN : 리소스의 이름만 식별, 위치는 모르지만 고유성은 보장(ftp 등)
- 서버, 클라이언트: 서버(데이터를 보내주기만 하는것), 클라이언트(데이터를 요청하기만 하는것)

## HTTP(HyperText Transfer Protocal)
- 서버와 클라이언트가 텍스트, 이미지, 동영상 등의 데이터를 주고 받을때 사용하는 프로토콜로 확장됨
- 웹 상에서 보는 바이너리 데이터도 http 멀티파트나 Base64 인코딩하여 사용
- 상태 비저장 프로토콜, 상태가 없는 프로토콜(Stateless 프로토콜)
- 모든 http 는 요청과 응답이 일대일로 대응되어야 한다
- 클라이언트는 항상 자신이 보낸 응답을 알수있다
- 그러나 서버로 http 요청을 보내기 직전까지 실제로 서버가 동작하는지 알 방법이 없다
- 일정 시간 이내에 응답이 없으면 타임아웃으로 간주함(안드로이드 10초, ios 60초)

- 요청과 응답이 1회성
- 상태는 쿠키, 세션, token 등으로 따로 관리해야함

### 세션과 쿠키
- 세션: 서버에 저장됨
- 쿠키: 브라우저에 저장됨

- HTTP 상태라는 개념이 존재하지 않기 때문에 세션과 쿠키를 사용해 구분
- 모바일에는 없는 개념: SharedPreference


### 토큰
- 로그인시 사용자 정보와 서명을 암호화 하기 위해서 만든 문자열
- 서버 저장 없이 클라이언트가 보관하고 매 요청마다 보내줌
- 서버는 디코딩해서 유효성만 검사

## 웹에서 뭔가 보내고 받을때 HTTP는 내용물이고, TCP/IP는 배송방식, IP주소

## API: 프로그래머가 어떤 기능을 쉽게 쓰게 해주는 함수/도구의 모음
- 내부 동작을 숨기고(추상화해서) 쉽게 사용할 수 있게 함

## 소켓: 통신을 위한 API 중 하나, 통신을 열고 데이터를 주고받기 위한 프로그래밍 인터페이스(API)
- TCP/UDP 같은 프로토콜을 실제로 사용할 수 있도록 해주는 api
- 통신을 위한 API 묶음

## RESTful API
- 서버와 클라이언트가 메세지를 주고 받을때 가장 많이 사용하는 통신 규격(암묵적인 룰)
- REST(representational state transfer)
- 자원을 url로 표현하고 행동은 메서드로 나누는 통신 방식
- REST 분산시스템을 위한 소프트웨어 아키텍처의 한 형태
- 요청주소와 메서드. json 규격을 이용하여 api를 정의
- 오늘날 가장 범용적으로 사용


## TCP 신뢰성 있는 연결지향성 앱에서 사용(이메일, 파일전송, 웹브라우저)
- Stateful 프로토콜
- 연결되면 연결끊기전까지 계속 메세지를 주고 받는 프로토콜
- 한쪽에 문제가 생기면 다른쪽에서 감지 가능
- 패킷(데이터 한번 갈때마다) 크기가 http 보다 작음 -> 속도빠름
- 소켓(컴퓨터끼리 데이터를 주고 받기 위한 통로)
- 각 요청이 소켓 1개를 공유, http는 각 요청이 소켓 1개씩 사용
- 따라서 요청을 식별할 식별자가 필요
- 응답을 알수있는 방법이 없기때문에 타임아웃에 대해 직접 구현해야 함

## IP 주소를 찾아가는 규칙

## TCP/IP 
- ip 번호와 포트번호 필요
- 모든 프로토콜의 문서 RFC 정의되어 있다
- 웹 페이지 접속, 메일 접속, 게임 등 모두 TCP/IP를 통한 통신에 의해 이루어진다
- https://datatracker.ietf.org/doc/html/rfc1180

## UDP 신속한 데이터 전송이나 손실 가능성이 있는 상황에 주로 사용
- 비연결형 프로토콜

## 요청 메서드
1. GET
- 일반적으로 웹 브라우저가 서버에 웹 페이지를 요청할 때 사용
- 읽기 요청
- body(데이터)를 포함할 수 없음
- ?와 &문자를 사용하는 쿼리 파라미터를 추가할 수 있다
- ?: 쿼리 파라미터의 시작을 의미
- &: 파라미터끼리 구분할때 사용

2. POST
- 웹 브라우저로 테스트 불가
- 클라이언트에서 서버랑 데이터가 포함된 요청을 보낼때 사용
- 로그인, 주문 요청 등
- 쿼리 파라미터뿐만 아니라 body로 데이터 전송

3. DELETE, PUT, PATCH
- 웹브라우저로 테스트 불가
- DELETE: 삭제
- PUT: 전체 업데이트
- PATCH: 일부 업데이트

## HTTP 요청 헤더
- 요청정보를 파악하는데 도움이 되는 다른 여러 정보를 포함할 수 있음
- 주로 인증, 캐싱, 클라이언트 힌트, 조건, 연결관리, 쿠키, CORS 등에 활용
- JSON 파일을 주고 받을때 Content-Type 에 application/json 으로 명시

## 상태코드
- 모든 http 응답에는 상태코드와 상태메세지가 있음: 상태코드가 있다는 것은 통신을 성공했다는 것
- 200 OK
- 400 Bad Request
- 404 Not Found
- 500 Internal Sever Error

## Mock 
- Mock해서 http 테스트 했을때 정확히 돌아간다고 하면 실제 통신에서는 확실히 통신되는건 맞는지
