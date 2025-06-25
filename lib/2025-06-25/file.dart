import 'dart:convert';
import 'dart:io';

void main() {
  final file = File('save.txt'); // 절대경로
  file.writeAsStringSync('hello\n', mode: FileMode.append);
  file.writeAsStringSync('hello\\', mode: FileMode.append);
  file.writeAsStringSync('hello\t', mode: FileMode.append);

  print(file.readAsStringSync());

  // 복사 : 읽어서 쓰면 복사
}

// JSON 이 그래서 왜 컴퓨터도 편하다고 생각하는거지?
// 직렬화 JSON validator
// 런타임에 터질수 있음

// 테스트를 위해서 역직렬화 하면 됨
// final Map<String, dynamic> json = jsonEncode('''{ 
//   "email": "jina",
  
// }''');

// print(json['name']);
