import 'package:modu_3_dart_study/2025-06-04/hero.dart';

// top-level
// 공통적으로 모든 파일에서 쓸수있게 된다
// 의미를 명확히 한 값으로 작성한다 예.heroMoney
int money = 100;

void main(){
  final hero1 = Hero(name: '홍길동', hp: 100);

  print(hero1);

  Person(); 
  // 생성자를 작성하지 않을 시에만 기본 생성자가 있는 것으로 본다
  // 생성자 만드는 순간 기본 생성자는 사라진다
}

class Person{
  // Person();
}