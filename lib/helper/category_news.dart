import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:profile_ui/models/news_model.dart';


class CategoryNews{
  List<NewsModel> allCategoryNews = [];

  


  //Get category api
  Future<void> getCategoryNews(String category) async{
    String api = "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=abb2572bf1364ed6a66dc4adb83a55c1";

    var response  = await http.get(Uri.parse(api));

    //Convert json
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      
      jsonData["articles"].forEach((element){
          if(element["urlToImage"] != null && element['description'] != null){
            
            // ignore: unnecessary_new
            NewsModel newsModel  = new NewsModel(
              author: element['author'].toString(), 
              title: element['title'].toString(), 
              description: element['description'].toString(), 
              url: element['url'].toString(),
              urlToImage: element['urlToImage'].toString(),
              );

                allCategoryNews.add(newsModel);
          }
      });
    }
  }
}