class Book{
  String title;
  DateTime publishDate;
  String comment;
  
  Book({
    required this.title, 
    required this.comment,
    DateTime? publishDate,
  }) : publishDate = publishDate ?? DateTime.now();

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

  // 리턴이 있을수있나?

  // hashcode 재정의
  @override
  int get hashCode => title.hashCode ^ publishDate.hashCode;

  // 컬렉션 라이브러리 첫 페이지에 testcode 
}

// typedef Comparator<Book> = int Function(Book a, Book b);

// class dateComparator implements Comparator<Book> {
//   int compare(Book a, Book b) {
//     return a.publishDate.compareTo(b.publishDate);
//   }
// }

void main () {

  Book book1 = Book(title: 'book01', comment: 'book1 comment', publishDate: DateTime.now());
  Book book2 = Book(title: 'book01', comment: 'book2 comment', publishDate: DateTime(2025,6,19,00,00));
  Book book3 = Book(title: 'book03', comment: 'book3 comment', publishDate: DateTime(2025,6,01,12,30));

  final List<Book> bookList = [];
  // final List<Book> sortedBookList = bookList.sorted((a, b) => -a.compareTo(b));

  bookList.add(book1);
  bookList.add(book2);
  bookList.add(book3);

  bookList.sort((a, b) => a.publishDate.compareTo(b.publishDate));

  print(book1.publishDate);
  print(book2.publishDate);
  print(book1 == book2);

  print(bookList);

}