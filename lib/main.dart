import 'package:flutter/material.dart';
import 'package:flutter_newsapiorg/screen/news_list_screen.dart';
import 'package:flutter_newsapiorg/view_models/article_list_vm.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fresh News',
      home: ChangeNotifierProvider(
        create: (_) => ArticleListViewModel(),
        child: NewsListScreen(),
      ),
    );
  }
}
