import 'package:flutter/material.dart';
import 'package:flutter_newsapiorg/models/article_model.dart';
import 'package:flutter_newsapiorg/screen/news_article_detail_screen.dart';
import 'package:flutter_newsapiorg/view_models/article_list_vm.dart';
import 'package:flutter_newsapiorg/widgets/news_list_widget.dart';
import 'package:provider/provider.dart';

class NewsListScreen extends StatefulWidget {
  @override
  _NewsListScreenState createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  final _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ArticleListViewModel vm = Provider.of<ArticleListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Top News'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _controller,
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                vm.search(keyword: value);
              }
            },
            decoration: InputDecoration(
              labelText: 'Enter search term',
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.search),
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  print('suffixIcon pressed');
                  _controller.text = '';
                },
              ),
            ),
          ),
          ContentList(),
        ],
      ),
    );
  }
}

class ContentList extends StatefulWidget {
  @override
  _ContentListState createState() => _ContentListState();
}

class _ContentListState extends State<ContentList> {
  @override
  void initState() {
    Provider.of<ArticleListViewModel>(context, listen: false)
        .populateTopHeadLines();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ArticleListViewModel vm = Provider.of<ArticleListViewModel>(context);

    switch (vm.loadingStatus) {
      case LoadingStatus.searching:
        return Expanded(
          child: Align(
            child: CircularProgressIndicator(),
          ),
        );
        break;
      case LoadingStatus.completed:
        return Expanded(
          child: NewsListWidget(
            articles: vm.articles,
            onTapArticle: (Article article) {
              _showNewsArticleDetails(context, article);
            },
          ),
        );
      default:
        return Expanded(
          child: Align(
            child: Text('No results found!'),
          ),
        );
        break;
    }
  }

  void _showNewsArticleDetails(BuildContext context, Article article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewsArticleDetailScreen(article: article),
      ),
    );
  }
}
