import 'package:expense_tracker_2/data/remote/models/expense_data_model.dart';

sealed class ExpenseEventBloc {}

class FetchInitialExpenses extends ExpenseEventBloc{}

class AddExpenseData extends ExpenseEventBloc{
  ExpenseDataModel expenses;
  AddExpenseData({required this.expenses});
}