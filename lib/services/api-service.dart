

import 'package:dio/dio.dart';
import 'package:fallou_sarr_exam/models/article.dart';
import 'package:flutter/material.dart';

class ApiService{


  Future<ArticleModel> getArticle(int num) async{
    final url  = 'https://hacker-news.firebaseio.com/v0/item/$num.json?print=pretty';
    final Dio dio = Dio();
    final response = await dio.get(url);
    if (response.statusCode == 200){
      debugPrint('okkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');
      var data = response.data;
      var json =  data as Map<String, dynamic>;
      ArticleModel article;
      article = ArticleModel.fromJson(json);
      return article;
    }
    else{
      debugPrint(' noonnnnnnnnnn   okkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');
      throw response;
    }
  }

  Future<List<ArticleModel>> getAllArticle() async {
    List<ArticleModel> articles = [];
    for(var i=1; i<= 100; i++){
      ArticleModel article = await getArticle(i);
      if(article.by != null){
        articles.add(article);
      }
    }
    return articles;
  }
}