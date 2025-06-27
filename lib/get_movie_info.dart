import 'dart:convert';

class Movie{
  String title;
  String director;
  num year;

  Movie.fromJson(Map<String, dynamic> map)
    : title = (map['title'] ?? ''),
      director = (map['director'] ?? ''),
      year = (map['year'] ?? 0);

  Movie(this.title, this.director, this.year);

  @override
  String toString() => 'Movie(title: $title, director: $director, year: $year)';
}

Future<dynamic> getMovieInfo() async{
  await Future.delayed(Duration(seconds: 2));

  final String jsonString = '''
  [
    {
      "title": "Star Ward",
      "director": "George Lucas",
      "year": 1977
    },
    {
      "title": "Star Ward2",
      "director": "George Lucas",
      "year": 1978
    }
  ]
  ''';

  if (jsonString is List) {
    final List<dynamic> movies = jsonDecode(jsonString); //List<Map<String, dynamic>>
    // final Movie movieList = Movie.fromJson(movies);
    final List<Movie> movieList = movies
      .map((item) => Movie.fromJson(item))
      .toList();

    return movieList;
  } else if (jsonString is Map<String, dynamic>) {
    final Map<String, dynamic> movies = jsonDecode(jsonString);
    final movieList = Movie.fromJson(movies);

    return movieList;
  } else {
    throw FormatException('jsonString Type Error');
  }
}

void main() {
  getMovieInfo();
}