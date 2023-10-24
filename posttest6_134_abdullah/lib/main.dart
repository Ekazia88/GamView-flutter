import 'package:flutter/material.dart';
import 'package:posttest6_134_abdullah/Game.dart';
import 'package:posttest6_134_abdullah/about_page.dart';
import 'package:posttest6_134_abdullah/home_page.dart';
import 'package:posttest6_134_abdullah/input_GamView.dart';


void main() {
  runApp(const MyApp());
}
// untuk membuat route antar halaman
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => Homepage(),
        '/Add' : (context) => AddReviewscreen(),
        '/About' :(context) => AboutPage(),
      },
      theme: new ThemeData(scaffoldBackgroundColor: Color(0xFF2B2B28)),
      );
  }
}

