import 'package:flutter/material.dart';
import 'package:it_security_app/Menues/Main_Menu/app_bar.dart';
import 'package:it_security_app/Screens/Home/model/article_model.dart';

class ArticlePage extends StatelessWidget {
  final Article article;

  ArticlePage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          appBar: AppBar(),
          title: Text(article.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(article.urlToImage),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                padding: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Text(
                  article.source.name,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                article.description,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                article.content,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0),
              )
            ],
          ),
        ));
  }
}
