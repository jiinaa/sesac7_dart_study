import 'dart:convert';

import 'package:modu_3_dart_study/data_source/remote/app_user_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/core/response.dart';
import 'package:modu_3_dart_study/dto/app_user_dto.dart';

class AppUserDataSourceImpl implements AppUserDataSource {
  final String baseUrl;

  http.Client _client;
  AppUserDataSourceImpl({http.Client? client, required this.baseUrl})
    : _client = client ?? http.Client();

  @override
  Future<Response<AppUserDto>> getUser(int userId) async {
    final response = await _client.get(Uri.parse(baseUrl));

    return Response(
      statusCode: response.statusCode,
      header: {'Content-Type': 'application/json'},
      body: jsonDecode(response.body),
    );
  }

  @override
  Future<Response<List<AppUserDto>>> getUserList() async {
    final response = await _client.get(Uri.parse(baseUrl));
    final decoded = jsonDecode(response.body);

    // response.body는 항상 List<dynamic> 타입 반환

    return Response(
      statusCode: response.statusCode,
      header: {'Content-Type': 'application/json'},
      body: decoded.map((e) => AppUserDto.fromJson(e)).toList(),
    );
  }

  @override
  Future<Response<AppUserDto>> createUser(AppUserDto dto) async {
    final response = await _client.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(dto.toJson()),
      // 서버와 통신해야하므로 dto 객체를 인자로 받고
      // dto.toJson : 객체를 Map 형태로 변환
      // Map을 json string 으로 변환
    );

    // response.body는 항상 List<dynamic> 타입 반환

    return Response(
      statusCode: response.statusCode,
      header: {'Content-Type': 'application/json'},
      body: AppUserDto.fromJson(jsonDecode(response.body)),
    );
  }
}
