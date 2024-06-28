import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_article_app/provider/favourite_providre.dart';
import 'package:provider/provider.dart';
import 'package:news_article_app/constants/constants.dart';

import '../models/news_model.dart';
import '../provider/functions/launch_url.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();

  static void getArticles() {}
}

class _ArticleScreenState extends State<ArticleScreen> {
  List<NewsModel> article = [];
  @override
  void initState() {
    super.initState();
    getArticles();
  }

  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Articles"),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Consumer<FavouriteProvider>(
              builder: (context, value, child) {
                for (int i = 0; i < article.length; i++) {
                  value.addArticleNo(article[i]);
                }
                return ListView.builder(
                    itemCount: article.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          launchUrls(Uri.parse(article[index].url));
                        },
                        leading: Image.network(
                          article[index].urlToImage,
                          height: 300,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          article[index].title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(article[index].publishedAt.toString()),
                        trailing: IconButton(
                          icon: Icon(value.favouriteList
                                  .contains(value.articleList[index])
                              ? Icons.favorite
                              : Icons.favorite_outline),
                          onPressed: () {
                            if (value.favouriteList
                                .contains(value.articleList[index])) {
                              value.removeFavourite(value.articleList[index]);
                            } else {
                              value.addToFavourite(value.articleList[index]);
                              value.addArticle(value.articleList[index]);
                            }
                          },
                        ),
                      );
                    });
              },
            ),
    );
  }

  Future<List<NewsModel>> getArticles() async {
    try {
      final response = await http.get(Uri.parse(APi_url));
      var data = jsonDecode(response.body.toString());
      print(response.body);
      if (response.statusCode == 200) {
        for (var i in data['articles']) {
          setState(() {
            article.add(NewsModel.fromJson(i));
            isLoading = false;
          });
        }
        return article;
      } else {
        return article;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
