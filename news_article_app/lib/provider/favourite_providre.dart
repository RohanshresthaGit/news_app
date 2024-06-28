import 'package:flutter/material.dart';

import '../models/news_model.dart';

class FavouriteProvider with ChangeNotifier {
  List<NewsModel> _favouriteList = [];
  List<NewsModel> _article = [];

  List<NewsModel> get favouriteList => _favouriteList;
  List<NewsModel> get articleList => _article;

  void addToFavourite(value) {
    _favouriteList.add(value);
    notifyListeners();
  }

  void addArticle(value) {
    _article.add(value);
    notifyListeners();
  } 
   void addArticleNo(value) {
    _article.add(value);
  }

  void removeFavourite(value) {
    _favouriteList.remove(value);
    notifyListeners();
  }

  void removeArticle(value) {
    _article.remove(value);
    notifyListeners();
  }
}
