import 'package:flutter/material.dart';
import 'package:flutter_marvel_app/feature/home/service/character_service.dart';
import 'package:flutter_marvel_app/feature/home/view_model/home_view_model.dart';
import 'package:flutter_marvel_app/product/constant/color.dart';
import 'package:flutter_marvel_app/product/constant/string_constant.dart';
import 'package:flutter_marvel_app/product/extension/theme_extension.dart';
import 'package:provider/provider.dart';
import '../../../product/widget/resourceListview_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(CharacterService()),
      builder: (BuildContext context, child) {
        return Consumer<HomeViewModel>(
            builder: (context, viewmodel, child) => Scaffold(
                  appBar: homeAppbar(context),
                  body: viewmodel.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : Stack(
                          children: [
                            ResourceListView(
                              viewModel: viewmodel,
                            ),
                            if (viewmodel.isPaginingLoading)
                              Container(
                                color: blackColor38,
                                child: const Center(
                                    child: CircularProgressIndicator()),
                              )
                          ],
                        ),
                ));
      },
    );
  }

  PreferredSizeWidget homeAppbar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(StringConstants.home,
          style: context.textTheme.headline5?.copyWith(color: blackColor)),
    );
  }
}
