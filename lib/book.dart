class Book{
  String title;
  DateTime publishDate;
  String comment;

  // DateTime today = DateTime.now();
  // Static 으로 설정하고 사용할 수 없는 이유
  // Static 은 클래스 안에 고정되는거지 인스턴스 안에 고정되는 값이 아니다.
  // Static 은 이 클래스가 로드될때 한번 생성되는 값이 되어버림

  Book({
    required this.title, 
    required this.comment,
    DateTime? publishDate,
  }) : publishDate = publishDate ?? DateTime.now();

  //: publishDate = publishDate ?? today;
  // 안되는 이유

  // 인스턴스가 안생겼는데 클래스의 필드 사용하려고 해서 클래스 내부에서 사용 불가
  // final todayDate = Book.publishDate.toString().substring(0,10);

  // copyWith()
  Book copyWith({
    String? title,
    String? comment,
    DateTime? publishDate,
  }){
    return Book(
      title: title ?? this.title,
      comment: comment ?? this.comment,
      publishDate: publishDate ?? this.publishDate
    );
  }

  @override
  String toString() {
    return 'Book(publishDate: $publishDate)';
  }

  // 제목과 출간일이 같으면 같은 책으로 판단한다
  // 연산자 재정의
  @override
  bool operator ==(Object other) =>
    identical(this, other) || 
    other is Book && 
    title == other.title &&
    publishDate.toString().substring(0,10) == other.publishDate.toString().substring(0,10);
    // publishDate.DateTime(publishDate.year, publishDate.month, publishDate.day)
  
  // 리턴이 있을수있나?

  // hashcode 재정의
  @override
  int get hashCode => title.hashCode ^ publishDate.hashCode;

  // static List<Book> bookList(List<Book> books){
  //   books.sort((a, b) => a.publishDate.compareTo(b.publishDate));
  //   return books;
  // }
  
}

// typedef Comparator<Book> = int Function(Book a, Book b);

// class dateComparator implements Comparator<Book> {
//   int compare(Book a, Book b) {
//     return a.publishDate.compareTo(b.publishDate);
//   }
// }

final List<Book> bookList = [];

void bookListVoid () {
  bookList.sort((a, b) => -a.publishDate.compareTo(b.publishDate));
}