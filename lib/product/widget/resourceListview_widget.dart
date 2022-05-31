// ignore_for_file: file_names
import 'package:flutter_marvel_app/product/constant/string_constant.dart';
import 'package:flutter_marvel_app/product/extension/mediaquery_extension.dart';
import 'package:flutter_marvel_app/product/extension/theme_extension.dart';
import '../../feature/home/view_model/home_view_model.dart';
import '../constant/color.dart';
import '../constant/project_padding.dart';
import '../mixin/character_mixin.dart';
import 'package:flutter/material.dart';
import '../navigator/navigator_routes.dart';

class ResourceListView extends StatelessWidget with CharacterNetwork {
  const ResourceListView({Key? key, required this.viewModel}) : super(key: key);
  final HomeViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: viewModel.controller,
      itemCount: viewModel.results.length,
      itemBuilder: (context, index) {
        String path = viewModel.results[index].thumbnail?.path ?? '';
        String ext = viewModel.results[index].thumbnail?.extension ?? '';
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, NavigateRoutes.homeDetail.withParaf,
                arguments: viewModel.results[index]);
          },
          child: Container(
            margin: ProjectPadding.pagePaddingAll,
            height: context.height * .3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ProjectPadding.radius),
              color: greyColor,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: characterNetworkImage(path, ext),
              ),
            ),
            child: Align(
              child: Text(
                viewModel.results[index].name ?? StringConstants.nameNull,
                style: context.textTheme.headline5
                    ?.copyWith(color: whiteColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
    );
  }
}
