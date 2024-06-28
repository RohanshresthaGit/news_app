import 'package:flutter/material.dart';
import 'package:news_article_app/provider/functions/launch_url.dart';
import 'package:provider/provider.dart';
import '../provider/favourite_providre.dart';
import 'articles_screen.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ArticleScreen.getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite Articles"),
        centerTitle: true,
      ),
      body: Consumer<FavouriteProvider>(
        builder: (context, value, child) {
          if (value.favouriteList.isEmpty) {
            return const Center(child: Text("No Favourite Item"));
          } else {
            return ListView.builder(
                itemCount: value.favouriteList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      launchUrls(Uri.parse(value.favouriteList[index].url));
                    },
                    leading: Image.network(
                      value.favouriteList[index].urlToImage,
                      height: 300,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      value.favouriteList[index].title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle:
                        Text(value.favouriteList[index].publishedAt.toString()),
                    trailing: IconButton(
                      icon: Icon(value.favouriteList
                              .contains(value.favouriteList[index])
                          ? Icons.favorite
                          : Icons.favorite_outline),
                      onPressed: () {
                        if (value.favouriteList
                            .contains(value.favouriteList[index])) {
                          value.removeFavourite(value.favouriteList[index]);
                        }
                      },
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
