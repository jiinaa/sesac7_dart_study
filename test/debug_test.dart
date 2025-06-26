import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:test/test.dart';
import 'package:modu_3_dart_study/debug.dart';

void main () {
  test('chart_data.json 파일을 Chart 클래스 객체로 출력할수있다', (){
    final chartList = readJsonFile();

    expect(chartList[0].collectionName, equals('collection1'));
  });
}