import 'package:flutter/material.dart';
import 'package:profile_ui/helper/category_news.dart';
import 'package:profile_ui/models/news_model.dart';
import 'package:profile_ui/widgets/news_tile.dart';

class Categories extends StatefulWidget {
  
  String category;
  Categories({required this.category});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<NewsModel> articles = [];
  bool _loading= true;

   @override
    void initState(){
      super.initState();
      getCategoryStory();
    }


  //Get particular category news
  getCategoryStory() async{
    CategoryNews categoryNews = CategoryNews();
    await categoryNews.getCategoryNews(widget.category);
    articles = categoryNews.allCategoryNews;

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
      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      )

      //Categories
      : Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:Column(
          children: [
            Expanded(
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
          ],
        ),
      ),
    );
  }
}