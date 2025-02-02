import 'package:expense_tracker_2/data/database/db_helper.dart';

class UserDataModel {
  int uId;
  String name;
  String email;
  String password;
  int phoneNo;
  String createdAt;

  UserDataModel({this.uId = 0, required this.name, required this.email, required this.password, required this.phoneNo, required this.createdAt});

  // fromMap
  factory UserDataModel.fromMap(Map<String, dynamic> map){
    return UserDataModel(uId: map[DBHelper.COLUMN_USER_ID], name: map[DBHelper.COLUMN_USER_NAME], email: map[DBHelper.COLUMN_USER_EMAIL], password: map[DBHelper.COLUMN_USER_PASSWORD], phoneNo: map[DBHelper.COLUMN_USER_PHONE_NO], createdAt: map[DBHelper.COLUMN_USER_CREATED_AT]);
  }

  // toMap -> when we need to return data as Map
  Map<String, dynamic> toMap (){
    return {
      DBHelper.COLUMN_USER_NAME : name,
      DBHelper.COLUMN_USER_EMAIL : email,
      DBHelper.COLUMN_USER_PASSWORD : password,
      DBHelper.COLUMN_USER_PHONE_NO : phoneNo,
      DBHelper.COLUMN_USER_CREATED_AT : createdAt
    };
  }
}