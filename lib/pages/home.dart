import 'package:flutter/material.dart';
import 'package:profile_ui/helper/category_news.dart';
import 'package:profile_ui/helper/data.dart';
import 'package:profile_ui/helper/news.dart';
import 'package:profile_ui/models/category_model.dart';
import 'package:profile_ui/models/news_model.dart';
import 'package:profile_ui/pages/categories.dart';
import 'package:profile_ui/widgets/category_tile.dart';
import 'package:profile_ui/widgets/news_tile.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
    List<CategoryModel> categories = [];
    List<NewsModel> articles = [];
    bool _loading= true;

    @override
    void initState(){
      super.initState();
      getNews();
      categories = getCategoriesTypes();
    }


  getNews()async{
    News news = News();
    await news.getNews();
    articles = news.allNews;
    setState(() {
      _loading = false;
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('MY' ,
            style: TextStyle(
              color: Colors.white
            ),
            ),
            SizedBox(width: 2.0,),
            Text('NEWS', style: TextStyle(
              color: Colors.white
            ),
            ),
          ],
        ),
        elevation: 0.0,
      ),
      body:_loading? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      )
      //Categories
      : Container(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: (){
              
              },
              child: Container(
                height: 70.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: categories.length,
                  itemBuilder: (itemBuilder ,index){
                    return CategoryTile(categoryName: categories[index].categoryName,);
                  }),
              ),
            ),
            //News
            Container(
              child: Expanded(
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: articles.length,
                  itemBuilder: (itemBuilder,index){
                    return NewsTile(
                      imageUrl: articles[index].urlToImage,
                      title: articles[index].title, 
                      desc: articles[index].description,
                      url: articles[index].url,);
                  }),
              ),
            )
          ],
        ),
      ),
    );
  }
}