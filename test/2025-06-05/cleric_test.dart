import 'package:test/test.dart';
import 'package:modu_3_dart_study/2025-06-05/cleric.dart';

void main(){

  group('clearic constructor test',(){

    test('생성자 테스트',(){
      // given(준비)
      // Cleric(“아서스", hp: 40, mp: 5) 와 같이, 이름, HP, MP 를 지정하여 인스턴스화 할 수 있다
      final cleric01 = Cleric(name: '아서스', hp: 40, mp: 6);

      cleric01.selfAid();

      // selfAid 한번 실행시 
      expect(cleric01.name, '아서스');
      expect(cleric01.hp, 50);
      expect(cleric01.mp, 1);


      // Cleric(“아서스", hp: 35) 와 같이, 이름과 HP만으로 지정하여 인스턴스화 할 수 있다
      final cleric02 = Cleric(name: '아서스', hp: 40);
      final cleric03 = Cleric(name: '아서스');

      // when(실행)
      cleric02.selfAid();
      cleric03.selfAid();

      // then(검증)
      // 이 때, MP는 최대 MP와 같은 값이 초기화 된다
      expect(cleric02.mp, 5);
      expect(cleric03.hp, 50);
    });

  });
}