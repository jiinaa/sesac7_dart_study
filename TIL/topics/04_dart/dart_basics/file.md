# 파일 조작

## 파일 조작의 기본 순서
1. 파일을 연다
2. 파일을 읽거나 쓴다
3. 파일을 닫는다

```dart
final file = File('save.txt'); // 파일 쓰기
final text = file.readAsStringSync(); // 파일 읽기
```