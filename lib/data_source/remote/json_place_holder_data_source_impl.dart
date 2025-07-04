import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/core/response.dart';
import 'package:modu_3_dart_study/data_source/remote/remote_data_source.dart';

class JsonPlaceHolderDataSourceImpl implements RemoteDataSource{

  static const _baseUrl = 'https://jsonplaceholder.typicode.com';

  @override
  Future<Response<Map<String, dynamic>>> creatPost(Map<String, dynamic> post) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/posts'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(post),
    );

    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }

  @override
  Future<Response<void>> deletePost(int id) async {
    final response = await http.delete(Uri.parse('$_baseUrl/posts/$id'));

    return Response (
      statusCode: response.statusCode,
      header: response.headers,
      body: null,
    );
  }
  // 제네릭 타입으로 void가 들어온 경우 body에서 null을 리턴하는 것을 유일하게 허락한다

  @override
  Future<Response<Map<String, dynamic>>> getPost(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl/posts/$id'));
    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }

  @override
  Future<Response<List<Map<String, dynamic>>>> getPosts() async {
    final response = await http.get(Uri.parse('$_baseUrl/posts'));
    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }

  @override
  Future<Response<Map<String, dynamic>>> patchPost (int id, Map<String, dynamic> post) async {
    final response = await http.get(Uri.parse('$_baseUrl/posts/$id'));
    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }

  @override
  Future<Response<Map<String, dynamic>>> updatePost(int id, Map<String, dynamic> post) async {
    final response = await http.get(Uri.parse('$_baseUrl/posts/$id'));
    return Response(
      statusCode: response.statusCode,
      header: response.headers,
      body: jsonDecode(response.body),
    );
  }
  
}

// http 에 있는 response? 
// 