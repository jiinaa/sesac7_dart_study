import 'package:modu_3_dart_study/core/network_error.dart';
import 'package:modu_3_dart_study/core/result.dart';
import 'package:modu_3_dart_study/data_source/remote/app_user_data_source.dart';
import 'package:modu_3_dart_study/dto/app_user_dto.dart';
import 'package:modu_3_dart_study/mapper/app_user_mapper.dart';
import 'package:modu_3_dart_study/model/app_user.dart';
import 'package:modu_3_dart_study/repository/app_user_repository.dart';
import 'dart:async';

class AppUserRepositoryImpl implements AppUserRepository {
  final AppUserDataSource _appUserDataSource;
  AppUserRepositoryImpl(this._appUserDataSource);

  // 인터페이스들이 들어오게 구성하고
  // 기능에 대한것도 인터페이스로 받아서 조합해서 사용

  NetworkError statusCodeToError(int? statusCode) {
    switch (statusCode) {
      case 401:
        return NetworkError.unauthorized;
      case 404:
        return NetworkError.notFound;
      case 500:
      case 501:
      case 502:
      case 503:
        return NetworkError.serverError;
      default:
        return NetworkError.unknown;
    }
  }

  // 따로 파일로 만들어서 구성

  @override
  Future<Result<AppUserDto, NetworkError>> createUser(AppUser appUser) async {
    final AppUserDto dto = appUser.toDto();

    try {
      final result = await _appUserDataSource
          .createUser(dto)
          .timeout(const Duration(seconds: 10));

      print('런타임 타입 : ${result.runtimeType}');
      // 런타임 타입 : Response<AppUserDto>

      // switch (result) {
      //   // Success 타입의 객체가 result 에 들어있을때 그 객체를 success라는 이름으로 받겠다
      //   case Success<Response<AppUserDto>, NetworkError> success:
      //     return Result.success(success.value.body);
      //   case Failure<Response<AppUserDto>, NetworkError> failure:
      //     final statusCode = result.statusCode;
      //     final errorType = statusCodeToError(statusCode);
      //     return Result.failure(errorType);
      // }
      // switch case 로 한 경우 타입 불일치때문에 계속 아무것에도 안걸리고 빠져나감

      if (result.statusCode >= 200 && result.statusCode < 300) {
        return Result.success(result.body);
      } else {
        final errorType = statusCodeToError(result.statusCode);
        return Result.failure(errorType);
      }
    } on TimeoutException {
      return Result.failure(NetworkError.requestTimeout);
    } on FormatException {
      return Result.failure(NetworkError.parseError);
    } catch (e) {
      return Result.failure(NetworkError.unknown);
    }

    throw Exception('Unexpected result type');
    // AppUserDto 값을 리턴해야함
  }

  @override
  Future<Result<AppUser, NetworkError>> getUser(int userId) async {
    try {
      final result = await _appUserDataSource
          .getUser(userId)
          .timeout(const Duration(seconds: 10));

      // const Duration(seconds: 10)
      // Duration const 생성자여서 const 붙이면 반복해서 사용하지 않아도 된다
      // static const titmeLimit = Duration(seconds: 10);

      switch (result) {
        // Success 타입의 객체가 result 에 들어있을때 그 객체를 success라는 이름으로 받겠다
        case Success<AppUser, NetworkError> success:
          final AppUser getUserResult = result.body.toModel();
          return Result.success(getUserResult);
        case Failure<AppUser, NetworkError> failure:
          final statusCode = result.statusCode;
          final errorType = statusCodeToError(statusCode);
          return Result.failure(errorType);
      }
    } on TimeoutException {
      return Result.failure(NetworkError.requestTimeout);
    } on FormatException {
      return Result.failure(NetworkError.parseError);
    } catch (e) {
      return Result.failure(NetworkError.unknown);
    }

    throw Exception('Unexpected result type');
  }

  @override
  Future<Result<List<AppUser>, NetworkError>> getUserList() async {
    try {
      final result = await _appUserDataSource.getUserList().timeout(
        const Duration(seconds: 10),
      );
      // final AppUser getUserListResult = result.map((e) => AppUser.fromJson(result.toModel()));

      switch (result) {
        // Success 타입의 객체가 result 에 들어있을때 그 객체를 success라는 이름으로 받겠다
        case Success<List<AppUserDto>, NetworkError> success:
          final getUserListResult = success.value
              .map((AppUserDto dto) => dto.toModel())
              .toList();

          return Result.success(getUserListResult);
        case Failure<List<AppUserDto>, NetworkError> failure:
          final statusCode = result.statusCode;
          final errorType = statusCodeToError(statusCode);
          return Result.failure(errorType);
      }
    } on TimeoutException {
      return Result.failure(NetworkError.requestTimeout);
    } on FormatException {
      return Result.failure(NetworkError.parseError);
    } catch (e) {
      return Result.failure(NetworkError.unknown);
    }

    throw Exception('Unexpected result type');
  }
}
