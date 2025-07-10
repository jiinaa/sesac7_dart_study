import 'package:modu_3_dart_study/dto/photo_dto.dart';
import 'package:modu_3_dart_study/core/response.dart';

abstract interface class PhotoDataSource {
  // Future<List<Map<String, dynamic>>> getAllData();
  Future<List<Map<String, Object?>>> getAllData();
}
