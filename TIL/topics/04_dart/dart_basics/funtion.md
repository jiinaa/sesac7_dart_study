# 람다식 lambda

- dart 함수도 1급 객체
- 함수: 같은 값을 넣으면 항상 같은 값이 나오는게 함수
- 함수도 객체로 받을 수 있다

- 리턴하고 입력이 없으면 넘어가진다

메서드: 클래스 안에 있으면 메서드
메서드는 이름이 있지만 함수에게 이름은 중요하지 않다

- Iterable<T> : 반복자

```dart
Iterable<int> 
```

reduce input 값 output 값이 같으니까 생략해서 합쳐서 사용할 수 있다
items.reduce()

- forEach 안에 담긴것은 함수이다, forEach 안에 휴먼에러가 발생하기 쉬워서 확정지어진 것만 쓰라고 함
