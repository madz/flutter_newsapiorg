import 'dart:convert';

import 'package:flutter_newsapiorg/constants/constants.dart';
import 'package:flutter_newsapiorg/models/article_model.dart';
import 'package:http/http.dart' as http;

class WebService {
  Future<List<Article>> fetchTopHeadLinesByKeyword({String keyword}) async {
    String url = Constants.headLinesByKeywordURL(keyword: keyword);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      final Iterable json = result['articles'];
      List<Article> articles =
          json.map((movie) => Article.fromJson(movie)).toList();
      print('articles length = ${articles.length}');

      return articles;
    } else {
      throw Exception('Failed to get news');
    }
  }

  Future<List<Article>> fetchTopHeadLines() async {
    String url = Constants.topHeadLinesURL();

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);

      final Iterable json = result['articles'];
      List<Article> articles =
          json.map((movie) => Article.fromJson(movie)).toList();
      print('articles length = ${articles.length}');

      return articles;
    } else {
      throw Exception('Failed to get news');
    }
  }
}
