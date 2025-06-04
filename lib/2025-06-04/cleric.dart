import 'dart:math'; // random 함수 사용을 위한 import

// 클래스(붕어빵 틀)
class Cleric{
  
  // 필드
  String name;

  int hp = 50; // hp, maxHp는 정수로 초기값 50
  final int maxHp = 50; // maxHp 는 상수 필드로 선언

  int mp = 10; // mp, maxMp는 정수로 초기치 10
  final int maxMp = 10; // maxMp는 상수 필드로 선언

  Cleric(this.name); // 생성자

  // 클래스에 selfAid 메소드 추가
  // 이 메소드에는 인수가 없고(), 리턴 값도 없다(void)
  void selfAid(){
    if(mp >= 5){
      mp -= 5; // mp 5 소모
      hp = maxHp.clamp(0, 50); 
      // hp는 최대hp 값으로 변경하고, maxHp는 최대 50을 넘지않는다(clamp(min,max))

      // clamp 말고 다른 방법으로 해결가능한지 확인
    }else{
      print('mp값이 부족합니다');
    }
  }

  // pray 메소드 추가
  int pray(){

    // mp가 0보다 크고 10보다 작은 범위일때
    if(mp < 10 && mp > 0 ){
      int randomPoint = Random().nextInt(2); // 정수인 
      mp += randomPoint;
    }else{
      print('mp값을 수정할 수 없습니다');
    }

    return mp.clamp(0,10);
  }
}

