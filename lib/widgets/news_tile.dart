import 'package:flutter/material.dart';
import 'package:profile_ui/pages/specific_new.dart';

class NewsTile extends StatelessWidget {
  
  final String imageUrl, title, desc,url;
  NewsTile({required this.imageUrl,required this.title,required this.desc, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=> SpecificNews(
            pageUrl: url,
          )));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0)
        ),
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              child: Image.network(imageUrl,),
              borderRadius: BorderRadius.circular(6.0),
              ),
            SizedBox(height: 5.0,),
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 15.0,
              ),
              ),
              SizedBox(height: 5.0,),
            Text(
              desc,
              style: TextStyle(
                color: Colors.black54,
              ),
              ),
          ],
        ),
      ),
    );
  }
}