import 'package:flutter/material.dart';
import 'package:profile_ui/pages/categories.dart';

class CategoryTile extends StatelessWidget {

  final String categoryName;
 
 CategoryTile({ required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Categories(category: categoryName.toLowerCase())));
      },
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.blue[800],
              width: 120,
              height: 60,
            ),
            Container(
              width: 120,
              height: 60,
              alignment: Alignment.center,
              child: Text(categoryName.toString(),
              style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}