import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/helper/news.dart';
import 'package:newsapp/models/article_model.dart';

import 'article_view.dart';

class CategoryNews extends StatefulWidget {
  final String categoryName, code;

  CategoryNews({this.categoryName,  this.code});
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {

  @override
  bool _loading = true;
  List<ArticleModel> article = List<ArticleModel>();
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  getNews() async{
    GetCategoryNews newsClass = new GetCategoryNews();
    await newsClass.getNews(widget.categoryName.toLowerCase(), widget.code);
    article = newsClass.news;
    setState(() {
      _loading = false;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.share,)),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Daily')  ,
            Text('News',style: TextStyle(color: Colors.blue),),

        ],
      ),
      ),

      body: _loading ?
      Center(
        child: CircularProgressIndicator(),
      )
          : SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Container(
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
                publishedDate: article[index].published.toString(),
              );
            },
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
                    imageUrl: imgUrl )
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