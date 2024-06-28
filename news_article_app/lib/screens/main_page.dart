import 'package:flutter/material.dart';
import 'package:news_article_app/screens/favourite_page.dart';

import 'articles_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final tabs = [ArticleScreen(), FavouritePage()];
  ValueNotifier<int> currentIndex = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentIndex,
      builder: (context, value, child) {
        return Scaffold(
          body: tabs[currentIndex.value],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex.value,
              onTap: (values) {
                currentIndex.value = values;
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.article), label: "Article"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.pink,
                    ),
                    label: "Favourites"),
              ]),
        );
      },
    );
  }
}
