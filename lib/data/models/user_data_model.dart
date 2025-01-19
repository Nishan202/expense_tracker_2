import 'package:expense_tracker_2/data/database/db_helper.dart';

class UserDataModel {
  int id;
  String name;
  String email;
  String password;
  int phoneNo;

  UserDataModel({this.id = 0, required this.name, required this.email, required this.password, required this.phoneNo});

  // fromMap
  factory UserDataModel.fromMap(Map<String, dynamic> map){
    return UserDataModel(id: map[DBHelper.COLUMN_USER_ID], name: map[DBHelper.COLUMN_USER_NAME], email: map[DBHelper.COLUMN_USER_EMAIL], password: map[DBHelper.COLUMN_USER_PASSWORD], phoneNo: map[DBHelper.COLUMN_USER_PHONE_NO]);
  }

  // toMap -> when we need to return data as Map
  Map<String, dynamic> toMap (){
    return {
      DBHelper.COLUMN_USER_NAME : name,
      DBHelper.COLUMN_USER_EMAIL : email,
      DBHelper.COLUMN_USER_PASSWORD : password,
      DBHelper.COLUMN_USER_PHONE_NO : phoneNo
    };
  }

}