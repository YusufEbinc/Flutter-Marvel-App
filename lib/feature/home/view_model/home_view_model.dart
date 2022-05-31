import 'package:flutter/material.dart';
import 'package:flutter_marvel_app/feature/home/model/character_model.dart';
import 'package:flutter_marvel_app/feature/home/service/character_service.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this.characterService) {
    character();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        leadMore();
      }
    });
  }
  late ICharacterService characterService;
  final controller = ScrollController();
  bool isLoading = false;

  bool isPaginingLoading = false;

  List<Results> results = [];

  int offset = 0;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void _changePaginingLoading() {
    isPaginingLoading = !isPaginingLoading;
    notifyListeners();
  }

  Future<void> character() async {
    _changeLoading();
    results = await characterItem();

    _changeLoading();
  }

  Future<List<Results>> characterItem() async {
    return (await characterService.fetchCharacterItem(offset))?.data?.results ??
        [];
  }

  void leadMore() async {
    _changePaginingLoading();

    offset++;
    final List<Results> leadList =
        (await characterService.fetchCharacterItem(offset))?.data?.results ??
            [];
    results.addAll(leadList);
    print(results.length);
    _changePaginingLoading();
  }
}
