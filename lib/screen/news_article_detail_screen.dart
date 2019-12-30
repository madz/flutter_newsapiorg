import 'package:flutter/material.dart';
import 'package:flutter_newsapiorg/models/article_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsArticleDetailScreen extends StatelessWidget {
  final Article article;
  NewsArticleDetailScreen({this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.article.title}'),
      ),
      body: Center(
        child: WebView(
          initialUrl: this.article.url,
        ),
      ),
    );
  }
}
