abstract interface class X {
  void a();
}

abstract class Y implements X {
  void b();
}

class A extends Y {
  @override
  void a() {
    print('Aa');
  }

  @override
  void b() {
    print('Ab');
  }

  void c() {
    print('Ac');
  }
}

class B extends Y {
  @override
  void a() {
    print('Ba');
  }

  @override
  void b() {
    print('Bb');
  }

  void c() {
    print('Bc');
  }
}

// 문제 1. obj.a(), obj.b(), obj.c() 중 어떤 걸 호출할 수 있는가?
X obj = A();  
// obj.a() 만 가능함

// 문제2. y1.a(); y2.a(); 를 실행하면 화면에 뭐가 출력되는가?
Y y1 = A();  
Y y2 = B();

// Aa, Ba 출력
 
