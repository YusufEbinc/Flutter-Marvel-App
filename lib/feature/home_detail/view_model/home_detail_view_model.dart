import 'package:flutter/material.dart';
import 'package:flutter_marvel_app/feature/home_detail/model/comic_model.dart';

import 'package:flutter_marvel_app/feature/home_detail/service/comics_service.dart';

class HomeDetailViewModel extends ChangeNotifier {
  HomeDetailViewModel(this.comicService, this.characterId) {
    _comic();
  }
  late IComicService comicService;

  bool isLoading = false;
  final int? characterId;

  List<Result> resultDetail = [];

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> _comic() async {
    _changeLoading();
    resultDetail = await _comicItem();

    _changeLoading();
  }

  Future<List<Result>> _comicItem() async {
    return (await comicService.fetchComicItem(characterId))?.data?.results ??
        [];
  }
}
