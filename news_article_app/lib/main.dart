import 'package:flutter/material.dart';
import 'package:news_article_app/provider/favourite_providre.dart';
import 'package:news_article_app/screens/articles_screen.dart';
import 'package:provider/provider.dart';
import 'screens/main_page.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavouriteProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
        routes: {'/articlePage': (context) => MainPage()},
      ),
    );
  }
}
