import 'package:flutter/material.dart';
import 'package:it_security_app/Screens/Home/components/customListTile.dart';
import 'package:it_security_app/Screens/Home/model/article_model.dart';
import 'package:it_security_app/Screens/Home/services/api_service.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: client.getArticle(),
      builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
        if (snapshot.hasData) {
          List<Article>? articles = snapshot.data;
          return ListView.builder(
            itemCount: articles!.length,
            itemBuilder: (context, index) =>
                customListTile(articles[index], context),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
