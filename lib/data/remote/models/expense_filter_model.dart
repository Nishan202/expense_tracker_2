import 'package:expense_tracker_2/data/remote/models/expense_data_model.dart';

class ExpenseFilterModel {
  String expenseType;
  num balance;
  List<ExpenseDataModel> allExpense;

  ExpenseFilterModel({required this.expenseType, required this.balance, required this.allExpense});
}