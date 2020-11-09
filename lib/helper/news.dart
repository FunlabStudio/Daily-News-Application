import 'dart:convert';

import 'package:newsapp/models/article_model.dart';
import 'package:http/http.dart'as http;

class News{
  List<ArticleModel> news = [];

  Future<void> getNews(String country) async{

    String url = "https://newsapi.org/v2/top-headlines?country=$country&apiKey=9593b422b16c464985fe7024d5bca96d";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body.toString());
    // print(jsonData);
    if(jsonData['status'] == 'ok'){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] !=null && element["description"] !=null){
          ArticleModel articleModel = ArticleModel(
            author: element['author'],
            title: element['title'],
            desc: element['description'],
            url: element['url'],
            urlToImg: element['urlToImage'],
            content: element['content'],
            published:  element['publishedAt'],


          );
          news.add(articleModel);
        }
      });
    }
  }

}

class GetCategoryNews{
  List<ArticleModel> news = [];

  Future<void>  getNews(String category, code) async{
    String url = "https://newsapi.org/v2/top-headlines?country=$code&category=$category&apiKey=9593b422b16c464985fe7024d5bca96d";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body.toString());
    //print(response.body);

    if(jsonData['status'] == 'ok'){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] !=null && element["description"] !=null){
          ArticleModel articleModel = ArticleModel(
            author: element['author'],
            title: element['title'],
            desc: element['description'],
            url: element['url'],
            urlToImg: element['urlToImage'],
            content: element['content'],
            published: element['publishedAt'],
          );
          news.add(articleModel);

        }
      });
    }



  }

}

