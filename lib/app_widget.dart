import 'package:flutter/material.dart';
import 'package:movie_app/pages/details_home_page.dart';

import 'pages/splash_page.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => const SplashPage(),
        '/login': (_) => LoginPage(),
        '/home': (_) => const HomePage(),
        '/details': (_) => const DetailsHomePage(),
      },
    );
  }
}
