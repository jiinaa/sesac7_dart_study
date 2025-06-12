import 'package:modu_3_dart_study/wizard.dart';
import 'hero.dart';

class Greatwizard extends Wizard {
  Greatwizard({required super.name});

  static int defaultMP = 150;

  @override int mp = defaultMP;

  @override
  void heal(Hero hero) {
    hero.hp += 25;
    mp -= 5;
  }

  void superHeal(Hero hero) {
    if ( mp < 0) {
      print('마나가 부족합니다');
      throw Exception('마나가 부족합니다');
    } else {
      hero.hp = Hero.defaultHp;
      mp -= 50;
      print('슈퍼 힐을 시전했습니다. 대상 HP: ${hero.hp}');
    }
  } 
}

