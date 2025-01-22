import 'package:expense_tracker_2/data/database/db_helper.dart';
import 'package:flutter/material.dart';

class CategoryDataModel {
  int id;
  String title;
  String icon;

  CategoryDataModel({required this.id, required this.title, required this.icon});

  factory CategoryDataModel.fromMap(Map<String, dynamic> map){
    return CategoryDataModel(id: map[DBHelper.CATEGORY_ID], title: map[DBHelper.CATEGORY_TITLE], icon: map[DBHelper.CATEGORY_IMAGE]);
  }

  Map<String, dynamic> toMap (){
    return {
      DBHelper.CATEGORY_TITLE : title,
      DBHelper.CATEGORY_IMAGE : icon
    };
  }
}