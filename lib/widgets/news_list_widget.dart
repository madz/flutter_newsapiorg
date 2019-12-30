import 'package:flutter/material.dart';
import 'package:flutter_newsapiorg/models/article_model.dart';

class NewsListWidget extends StatelessWidget {
  final List<Article> articles;
  final Function(Article article) onTapArticle;

  NewsListWidget({this.articles, this.onTapArticle});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles == null ? 0 : articles.length,
      itemBuilder: (context, index) {
        final article = articles.elementAt(index);
        return ListTile(
          onTap: () {
            this.onTapArticle(article);
          },
          leading: Container(
            height: 100,
            width: 100,
            child: article?.urlToImage == null
                ? Image.asset("images/news.jpg")
                : Image.network(article?.urlToImage),
          ),
          title: Text(
            article?.title ?? "",
          ),
        );
      },
    );
  }
}
