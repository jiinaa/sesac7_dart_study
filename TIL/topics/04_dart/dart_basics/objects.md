# Object 타입 vs object 객체

## Object 타입
- Dart의 모든 클래스의 최상위 타입
- 모든 클래스는 Object 클래스의 메서드와 프로퍼티를 가지고 있다
- Object 타입 변수에는 모든 인스턴스를 대입할 수 있다

### Object 클래스의 대표 메서드 및 프로퍼티
- 동등성 검사할때는 가지고있는 모든 것들을 확인하고 재정의해야 하는 것임

1. .toString(): 문자열 표현을 얻음
- 모든 object 가 가지고 있음, 암묵적으로
- print 할때 암묵적으로 toString()을 가지고 있다고 본다
- 객체의 내용을 알기쉽게 보여주기 위해서 toString 메서드를 사용한다

2. operator ==: 비교

```dart
// 동등성 비교 규칙 재정의
bool operator == (Hero hero) =>
    indentical(this, other) || //indentical : 실제 객체 참조 주소 비교
    other is Hero && runtimeType == other.runtimeType;

    {
        if(hero is Hero)
    }

// == 참조 비교
// 리스트 안에서도 비교 재정의 할 수 있다

```
3. hashcode
- 실행할때 마다 바뀌는 무작위의 값(메모리 주소를 볼수있는 방법이 없으니 메모리 주소를 보는 것이라고 개념을 이해해도 무방하다)
- 숫자로 구성되어있다
- object가 가지고 있는것이고 
- Set에서 사용
- 검색 속도가 빠르다

### hasecode 참고

- String 은 text 가 같으면 같은 hashcode 값, const 같이
- name.hashcode 로 비교해서 규칙을 재정의한다
- 복사한 값

## object 객체
- 실제로 메모리에 존재하는 실체
- ex: final p = Person(); 에서 p는 객체
- 어떤 클래스의 인스턴스
