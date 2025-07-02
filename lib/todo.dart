import 'dart:convert';
import 'dart:io';

abstract interface class TodoDataSource {
  Future<Todo> getToDo(); 
  // 여기서 Future 타입으로 명시하는 이유?
  // 비동기 함수 명시, 데이터를 가져오는데 시간이 걸릴 수 있으니
}

// 구현체와 인터페이스를 구별하는 이유?

// 구현체
class TodoDataSourceImpl implements TodoDataSource{
  
  @override
  // 선언만 되고 실행되기 전 인 상태
  // Future를 리턴하는 비동기 함수
  // Future는 아직 완료되지 않은 비동기 작업의 결과를 담는 객체이며 미래에 값 또는 에러를 반환할 것을 약속한다

  Future<Todo> getToDo() async {

    final jsonFile = await File('lib/assets/todo.json').readAsString();

    // readAsStringSync(): 문자열로 동기적으로 읽는다, 이 작업이 끝날때까지 기다린다
    // readAsString: 문자열로 읽는다
    Map<String, dynamic> todoMap = jsonDecode(jsonFile);
    final todo = Todo.fromJson(todoMap);

    return todo;
  }
}

// 객체
class Todo{
  num userId;
  num id;
  String title;
  bool completed;

  Todo({required this.userId, required this.id, required this.title, required this.completed});
  
  factory Todo.fromJson(Map<String, dynamic> todoMap) {

    // 타입체크
    if( todoMap['userId'] is! num ) {
      throw FormatException('userId 타입 오류');
    }
    if( todoMap['id'] is! num ) {
      throw FormatException('userId 타입 오류');
    }
    if( todoMap['title'] is! String ) {
      throw FormatException('userId 타입 오류');
    }
    if( todoMap['completed'] is! bool ) {
      throw FormatException('userId 타입 오류');
    }
  
    return Todo(userId : (todoMap['userId'] ?? 0),
      id : (todoMap['id']) ?? 0,
      title : (todoMap['title'] ?? ''),
      completed : (todoMap['completed'] ?? false));
  } 

  Map<String, dynamic> toJson(){
    // 아래 하나하나가 의미하는게 정확히 뭐지? 
    // map 의 키 userId 에 Todo 객체의 필드값 userId 를 담겠다 
    return {'userId' : userId, 'id' : id, 'title' : title, 'completed' : completed};
  }
}



