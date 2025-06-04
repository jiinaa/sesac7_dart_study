// 클래스(붕어빵 틀)
class Cleric{
  
  // 필드
  String name;

  int hp = 50; // hp, maxHp는 정수로 초기값 50
  final int maxHp = 50; // maxHp 는 상수 필드로 선언

  int mp = 10; // mp, maxMp는 정수로 초기치 10
  final int maxMp = 10; // maxMp는 상수 필드로 선언

  Cleric(this.name); // 생성자
}

