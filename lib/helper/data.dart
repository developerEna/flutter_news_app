
import 'package:profile_ui/models/category_model.dart';



//Method to add various categories
List<CategoryModel> getCategoriesTypes (){


  List<CategoryModel> categorytype = [];
  

  categorytype.add(CategoryModel(categoryName: 'General'));
  categorytype.add(CategoryModel(categoryName: 'Business'));
  categorytype.add(CategoryModel(categoryName: 'Health'));
  categorytype.add(CategoryModel(categoryName: 'Sports'));
  categorytype.add(CategoryModel(categoryName: 'Entertainment'));
  categorytype.add(CategoryModel(categoryName: 'Science'));
  categorytype.add(CategoryModel(categoryName: 'Technology'));
  

  return categorytype;


}