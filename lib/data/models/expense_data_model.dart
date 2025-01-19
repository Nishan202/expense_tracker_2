import 'package:expense_tracker_2/data/database/db_helper.dart';

class ExpenseDataModel {
  int id;
  String title;
  String description;
  num amount;
  num balance;
  String expenseType;
  int expenseCategoryId;
  DateTime date;

  ExpenseDataModel({this.id = 0, required this.title, required this.description, required this.amount, required this.balance, required this.date, required this.expenseType, required this.expenseCategoryId});

  // fromMap
  factory ExpenseDataModel.fromMap(Map<String, dynamic> map){
    return ExpenseDataModel(id: map[DBHelper.COLUMN_EXPENSE_ID], title: map[DBHelper.COLUMN_EXPENSE_TITLE], description: map[DBHelper.COLUMN_EXPENSE_DESCRIPTION], date: map[DBHelper.COLUMN_EXPENSE_DATE], amount: map[DBHelper.COLUMN_EXPENSE_AMOUNT], balance: map[DBHelper.COLUMN_EXPENSE_BALANCE], expenseType: map[DBHelper.COLUMN_EXPENSE_TYPE], expenseCategoryId: map[DBHelper.COLUMN_EXPENSE_CATEGORY_ID],);
  }

  // toMap -> when we need to return data as Map
  Map<String, dynamic> toMap (){
    return {
      DBHelper.COLUMN_EXPENSE_TITLE : title,
      DBHelper.COLUMN_EXPENSE_DESCRIPTION : description,
      DBHelper.COLUMN_EXPENSE_DATE : date,
      DBHelper.COLUMN_EXPENSE_AMOUNT : amount,
      DBHelper.COLUMN_EXPENSE_BALANCE : balance,
      DBHelper.COLUMN_EXPENSE_TYPE : expenseType,
      DBHelper.COLUMN_EXPENSE_CATEGORY_ID : expenseCategoryId
    };
  }

}