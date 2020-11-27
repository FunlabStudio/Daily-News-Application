import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/helper/data.dart';
import 'package:newsapp/helper/news.dart';
import 'package:newsapp/models/article_model.dart';
import 'package:newsapp/models/category_model.dart';
import 'package:intl/intl.dart';
import 'article_view.dart';
import 'category_news.dart';


class Home extends StatefulWidget {
  final String countryCode, countryImg;
  Home({this.countryCode, this.countryImg});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> article = new List<ArticleModel>();

  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategory(widget.countryCode);
    getNews();
  }

  getNews() async{
    News newsClass = new News();
    await newsClass.getNews(widget.countryCode);

    article = newsClass.news;
    setState(() {
      _loading = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Daily')  ,
            Text('News',style: TextStyle(color: Colors.blue),),
          ],
        ),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: CachedNetworkImage(
                  imageUrl: widget.countryImg,width: 40, height: 40, fit: BoxFit.cover ,
                ),
              ),
            ),
              )
        ],
      ),
      body:
      _loading ?
      Center(
        child: CircularProgressIndicator(),
      )
       : Container(
         padding: EdgeInsets.all(10),
         child: Stack(
          children: [
            ///Categories
            Container(
              height: 70.0,
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: categories.length,
                itemBuilder: (context, index){
                  return CategoryTile(
                    imageUrl: categories[index].imageAssetUrl,
                    categoryName: categories[index].categoryName,
                    code: categories[index].countryCode,

                  );
                }
              ),
            ),
            ///Article
            Container(
              margin: EdgeInsets.only(top: 80),
              child: ListView.builder(
                itemCount: article.length,
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return BlogTile(
                    imgUrl: article[index].urlToImg,  
                    title: article[index].title,
                    desc: article[index].desc,
                    url: article[index].url,
                    publishedDate: article[index].published,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}


class CategoryTile extends StatelessWidget {

final imageUrl, categoryName, code;
CategoryTile({this.imageUrl, this.categoryName, this.code});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => CategoryNews(
            categoryName: categoryName,
            code: code ,
          ),
        ));

      },
      child: Center(

        child: Container(

          margin: EdgeInsets.only(right: 10),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl, width: 100, height: 60,fit: BoxFit.cover,)
              ),
              Container(
                width: 100,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.black38,
                ),
                child: Text(categoryName, style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {


  final String imgUrl, title, desc, url, publishedDate;


  BlogTile({@required this.imgUrl,@required this.title,@required this.desc, @required this.publishedDate,@required this.url});



  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ArticleView(
              blogUrl: url,
            )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: imgUrl,
                ),
            ),
            SizedBox(height: 10,),
            Text(title, style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),),
            SizedBox(height: 6,),
            Text(desc, style: TextStyle(
              fontSize: 15,
              color: Colors.black54,
            ),),

            Text('Publish Date: ${publishedDate.substring(0, 10)}' +' '+ 'Publish Time: ${publishedDate.substring(11, 16)}',
              style: TextStyle(color: Colors.black26, fontSize: 10,),
            ),
          ],
        ),
      ),
    );
  }
}





