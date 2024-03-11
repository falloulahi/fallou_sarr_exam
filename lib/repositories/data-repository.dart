

import 'package:fallou_sarr_exam/models/article.dart';
import 'package:fallou_sarr_exam/services/api-service.dart';
import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier{
  final ApiService api = ApiService();
  final List<ArticleModel> _articles = [];

  List<ArticleModel> get allArticles => _articles;

  Future<void> getAllArticle() async{
    try{
      List<ArticleModel> articles =  await api.getAllArticle();
      _articles.addAll(articles);
      notifyListeners();
    }catch(response){
      debugPrint("ERROR: ==>   $response");
    }
  }

  Future<void> initData() async{
    await Future.wait([
      getAllArticle()
    ]);
  }
}