import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_marvel_app/feature/home_detail/model/comic_model.dart';

import '../../../product/constant/keys.dart';

abstract class IComicService {
  Future<ComicsModel?> fetchComicItem(int? id);
}

class ComicService extends IComicService {
  Dio dio = Dio(
      BaseOptions(baseUrl: 'http://gateway.marvel.com/v1/public/characters'));

  @override
  Future<ComicsModel?> fetchComicItem(int? id) async {
    try {
      final response = await dio.get(
          '/$id/comics?format=${Keys.format}&formatType=${Keys.formatType}&dateRange=${Keys.dateRange}&offset=${Keys.offsetComic}&limit=${Keys.limitComic}&apikey=${Keys.apikey}&ts=${Keys.ts}&hash=${Keys.hash}');

      if (response.statusCode == HttpStatus.ok) {
        final body = response.data;
        if (body is Map<String, dynamic>) {
          return ComicsModel.fromMap(body);
        }
      }
    } on DioError catch (exeption) {
      debugPrint(exeption.toString());
    }
    return null;
  }
}
