import 'package:flutter_marvel_app/feature/home/model/character_model.dart';
import 'package:flutter_marvel_app/feature/home/service/character_service.dart';
import 'package:flutter_marvel_app/feature/home_detail/model/comic_model.dart';
import 'package:flutter_marvel_app/feature/home_detail/service/comics_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Get character', () async {
    final characterService = CharacterService();
    final response = await characterService.fetchCharacterItem(0);
    expect(response is CharacterModel, true);
  });

  test('Get comics', () async {
    final comicService = ComicService();
    int id = 1017100;
    final response = await comicService.fetchComicItem(id);
    expect(response?.data?.results is List<Result>, true);
  });
}
