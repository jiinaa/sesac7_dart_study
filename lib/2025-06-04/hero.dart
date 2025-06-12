class Slime{
  String name;
  int hp;

  Slime(this.name, this.hp);
}

// 클래스 명 pascal
class Hero{
  // 필드영역
  // 필드명 camelcase
  String name;
  int hp;

  Hero({required this.name, this.hp = 0}); // 생성자

  // 메소드명 camelcase
  void attack(Slime slime){
    print('$name 이 $slime 을 공격했다');
    hp -= 10;
  }

}
void main(){

}