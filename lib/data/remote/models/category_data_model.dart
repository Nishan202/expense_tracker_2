import 'package:expense_tracker_2/data/database/db_helper.dart';

class CategoryDataModel {
  int cId;
  String title;
  String imageIcon;

  CategoryDataModel({required this.cId, required this.title, required this.imageIcon});

  factory CategoryDataModel.fromMap(Map<String, dynamic> map){
    return CategoryDataModel(cId: map[DBHelper.CATEGORY_ID], title: map[DBHelper.CATEGORY_TITLE], imageIcon: map[DBHelper.CATEGORY_IMAGE]);
  }

  Map<String, dynamic> toMap (){
    return {
      DBHelper.CATEGORY_TITLE : title,
      DBHelper.CATEGORY_IMAGE : imageIcon
    };
  }
}