import 'package:expense_tracker_2/data/database/db_helper.dart';

class ExpenseDataModel {
  int? expenseId; // auto incremented
  int uId;
  int categoryId;
  String title;
  String description;
  double amount;
  double balance;
  String expenseType;
  String date;

  ExpenseDataModel({this.expenseId, required this.uId, required this.categoryId, required this.title, required this.description, required this.amount, required this.balance, required this.date, required this.expenseType,});

  // fromMap
  factory ExpenseDataModel.fromMap(Map<String, dynamic> map){
    return ExpenseDataModel(expenseId: map[DBHelper.COLUMN_EXPENSE_ID], title: map[DBHelper.COLUMN_EXPENSE_TITLE], description: map[DBHelper.COLUMN_EXPENSE_DESCRIPTION], date: map[DBHelper.COLUMN_EXPENSE_DATE], amount: map[DBHelper.COLUMN_EXPENSE_AMOUNT], balance: map[DBHelper.COLUMN_EXPENSE_BALANCE], expenseType: map[DBHelper.COLUMN_EXPENSE_TYPE], categoryId: map[DBHelper.COLUMN_EXPENSE_CATEGORY_ID], uId: map[DBHelper.COLUMN_FK_USER_ID],);
  }

  // toMap -> when we need to return data as Map
  Map<String, dynamic> toMap (){
    return {
      DBHelper.COLUMN_FK_USER_ID : uId,
      DBHelper.COLUMN_EXPENSE_TITLE : title,
      DBHelper.COLUMN_EXPENSE_DESCRIPTION : description,
      DBHelper.COLUMN_EXPENSE_DATE : date,
      DBHelper.COLUMN_EXPENSE_AMOUNT : amount,
      DBHelper.COLUMN_EXPENSE_BALANCE : balance,
      DBHelper.COLUMN_EXPENSE_TYPE : expenseType,
      DBHelper.COLUMN_EXPENSE_CATEGORY_ID : categoryId
    };
  }

}