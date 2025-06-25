import 'dart:io';

abstract interface class FileOperations {
  // 지정된 경로의 파일을 다른 경로로 복사합니다.

  // [sourcePath] 복사할 원본 파일의 경로
  // [targetPath] 파일이 복사될 대상 경로

  // 복사란 읽어서 쓰기
  void copy(String sourcePath, String targetPath){
    final file = File(sourcePath);
    final readFile = file.readAsStringSync(); // 읽기
    file.writeAsStringSync(readFile, mode: FileMode.write); // 쓰기
  }
  
}