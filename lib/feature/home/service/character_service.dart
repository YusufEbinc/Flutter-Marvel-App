import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_marvel_app/feature/home/model/character_model.dart';

import '../../../product/constant/keys.dart';

abstract class ICharacterService {
  Future<CharacterModel?> fetchCharacterItem(int offset);
}

class CharacterService extends ICharacterService {
  Dio dio = Dio(
      BaseOptions(baseUrl: 'http://gateway.marvel.com/v1/public/characters?'));

  @override
  Future<CharacterModel?> fetchCharacterItem(int offset) async {
    try {
      final response = await dio.get(
          'limit=${Keys.limit}&offset=$offset&ts=${Keys.ts}&apikey=${Keys.apikey}&hash=${Keys.hash}');

      if (response.statusCode == HttpStatus.ok) {
        final body = response.data;
        if (body is Map<String, dynamic>) {
          print(body);
          return CharacterModel.fromJson(body);
        }
      }
    } on DioError catch (exeption) {
      debugPrint(exeption.toString());
    }
    return null;
  }
}
