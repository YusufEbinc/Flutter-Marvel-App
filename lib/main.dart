import 'package:flutter/material.dart';
import 'package:flutter_marvel_app/product/constant/color.dart';

import 'package:flutter_marvel_app/product/navigator/navigator_routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            color: backroundColor, iconTheme: IconThemeData(color: blackColor)),
        scaffoldBackgroundColor: backroundColor,
        textTheme: GoogleFonts.josefinSansTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      routes: NavigatorRoutes().items,
      initialRoute: "/",
    );
  }
}
