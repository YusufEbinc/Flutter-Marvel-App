import 'package:flutter/material.dart';
import 'package:flutter_marvel_app/feature/home/model/character_model.dart';
import 'package:flutter_marvel_app/feature/home_detail/service/comics_service.dart';
import 'package:flutter_marvel_app/feature/home_detail/view_model/home_detail_view_model.dart';
import 'package:flutter_marvel_app/product/constant/color.dart';
import 'package:flutter_marvel_app/product/constant/project_padding.dart';
import 'package:flutter_marvel_app/product/extension/string_null_extension.dart';
import 'package:flutter_marvel_app/product/extension/theme_extension.dart';
import 'package:flutter_marvel_app/product/mixin/character_mixin.dart';
import 'package:provider/provider.dart';

import '../../../product/constant/string_constant.dart';
import '../../../product/extension/mediaquery_extension.dart';

class HomeDetailView extends StatelessWidget with CharacterNetwork {
  const HomeDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var results = ModalRoute.of(context)?.settings.arguments as Results;

    return ChangeNotifierProvider(
      create: (context) => HomeDetailViewModel(
        ComicService(),
        results.id,
      ),
      builder: (BuildContext context, child) {
        return Consumer<HomeDetailViewModel>(
          builder: (context, value, child) => Scaffold(
            appBar: homeDetailAppbar(context),
            body: value.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.all(ProjectPadding.radius),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: context.height * .4,
                            decoration: BoxDecoration(
                              color: greyColor,
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: characterNetworkImage(
                                      results.thumbnail?.path,
                                      results.thumbnail?.extension)),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.all(ProjectPadding.padding),
                            child: Text(
                              results.name ?? StringConstants.descriptionNull,
                              style: context.textTheme.headline5?.copyWith(
                                  color: blackColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          if (!results.description!.isStringNullEmpty) ...[
                            Padding(
                              padding:
                                  const EdgeInsets.all(ProjectPadding.padding),
                              child: Text(
                                results.description ??
                                    StringConstants.descriptionNull,
                                style: context.textTheme.headline6?.copyWith(
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ],
                          const Divider(
                            color: blackColor,
                          ),
                          if (!value.resultDetail.length.isListNullEmpty) ...[
                            ComicListViewBuilder(
                              value: value,
                            )
                          ]
                        ],
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }

  PreferredSizeWidget homeDetailAppbar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text(
        StringConstants.homeDetail,
        style: context.textTheme.headline5?.copyWith(color: blackColor),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back),
      ),
    );
  }
}

// ignore: must_be_immutable
class ComicListViewBuilder extends StatelessWidget {
  ComicListViewBuilder({
    Key? key,
    required this.value,
  }) : super(key: key);
  HomeDetailViewModel value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * .4,
      child: ListView.builder(
        itemCount: value.resultDetail.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(ProjectPadding.padding),
            child: Container(
              decoration: BoxDecoration(
                  color: cardBackroundColor,
                  borderRadius: BorderRadius.circular(ProjectPadding.radius)),
              child: Padding(
                padding: const EdgeInsets.all(ProjectPadding.padding),
                child: Text(
                  value.resultDetail[index].title ?? StringConstants.nameNull,
                  style:
                      context.textTheme.headline6?.copyWith(color: blackColor),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
