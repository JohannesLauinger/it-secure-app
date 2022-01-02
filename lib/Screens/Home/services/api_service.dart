import 'dart:convert';

import 'package:http/http.dart';
import 'package:it_security_app/Screens/Home/model/article_model.dart';

class ApiService {
  final endPointUrl =
      "https://newsapi.org/v2/everything?q=it-sicherheit&language=de&sortBy=publishedAt&apiKey=9e9588b9d12b4b04afd182ace64b99ab";

  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl);

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articels");
    }
  }
}
