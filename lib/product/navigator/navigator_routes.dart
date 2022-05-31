import 'package:flutter_marvel_app/feature/home/view/home_view.dart';
import 'package:flutter_marvel_app/feature/home_detail/view/home_detail_view.dart';

class NavigatorRoutes {
  static const paraf = "/";
  final items = {
    paraf: (context) => const HomeView(),
    NavigateRoutes.homeDetail.withParaf: (context) => const HomeDetailView()
  };
}

enum NavigateRoutes { homeDetail }

extension NavigateRoutesExtension on NavigateRoutes {
  String get withParaf => "/$name";
}
