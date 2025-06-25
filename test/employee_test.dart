import 'dart:convert';
import 'dart:io';
import 'package:test/test.dart';
import 'package:modu_3_dart_study/employee.dart';

void main () {

  // 총무부 리더, 홍길동, 41세 의 인스턴스를 생성
  final person = Employee(name: '홍길동', age: 41);
  final team = Department(name: '총무부', leader: person);
  final filePath = 'lib/company.txt';

  final result = saveFile(team, filePath);

  test('company.txt 파일안에 작성된 내용은 직렬화한 내용과 동일하다', (){
    expect(result == File(filePath).readAsStringSync(), isTrue);
  });

  // 역직렬화를 활용해서 테스트
  test('company.text 에서 제공받은 json string 값을 역직렬화 한 값은 생성한 인스턴스의 값과 같다',(){
    // 받은 값
    final String orginString = File(filePath).readAsStringSync();

    // JSON String -> Map
    final Map<String, dynamic> json = jsonDecode(orginString);

    // Map -> 객체
    final Department dept = Department.fromJson(json);

    print(dept.toString());

    expect(team.name == dept.name, isTrue); 
    expect(team.leader.name == dept.leader.name, isTrue); 
    expect(team.leader.age == dept.leader.age, isTrue); 
  });
}