import 'package:flutter/foundation.dart';
import 'package:flutter_newsapiorg/models/article_model.dart';
import 'package:flutter_newsapiorg/services/webservice.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class ArticleListViewModel extends ChangeNotifier {
  LoadingStatus _loadingStatus = LoadingStatus.searching;
  LoadingStatus get loadingStatus => _loadingStatus;

  List<Article> _articles = [];
  List<Article> get articles => _articles;

  Future<void> populateTopHeadLines() async {
    updateLoadingStatus(LoadingStatus.searching);
    this._articles = await WebService().fetchTopHeadLines();
    updateLoadingStatus(
        _articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed);
    notifyListeners();
  }

  Future<void> search({String keyword}) async {
    updateLoadingStatus(LoadingStatus.searching);
    this._articles =
        await WebService().fetchTopHeadLinesByKeyword(keyword: keyword);
    updateLoadingStatus(
        _articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed);
    notifyListeners();
  }

  updateLoadingStatus(LoadingStatus loadingStatus) {
    this._loadingStatus = loadingStatus;
  }
}
