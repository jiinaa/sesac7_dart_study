import 'package:modu_3_dart_study/model/model_photo.dart';
import 'package:modu_3_dart_study/dto/photo_dto.dart';

extension DtoToPhotoMapper on PhotoDto {
  PhotoType parsePhotoType(String? type) {
    switch (type) {
      case 'article':
        return PhotoType.article;
      case 'image':
        return PhotoType.image;
      case 'video':
        return PhotoType.video;
      default:
        return PhotoType.unknown;
    }
  }

  DateTime parseDateTime(String? createdAt) {
    if (createdAt == null || createdAt.isEmpty) {
      return DateTime(0);
    }
    return DateTime.parse(createdAt);
    // DateTime.parse: 문자열을 DateTime 객체로 바꿔주는 메서드
  }

  ModelPhoto toModel() {
    return ModelPhoto(
      id: id ?? 0,
      type: parsePhotoType(type),
      title: title ?? '',
      content: content ?? '',
      createdAt: parseDateTime(createdAt),
      url: url ?? '',
      caption: caption ?? '',
    );
  }
}

extension ModelPhotoToDtoMapper on ModelPhoto {
  ModelPhoto toDto() {
    return ModelPhoto(
      id: id,
      type: type,
      title: title,
      content: content,
      createdAt: createdAt,
      url: url,
      caption: caption,
    );
  }
}
