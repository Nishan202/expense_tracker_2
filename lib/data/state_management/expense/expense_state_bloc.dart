 import 'package:expense_tracker_2/data/remote/models/expense_data_model.dart';
import 'package:expense_tracker_2/data/remote/models/expense_filter_model.dart';

sealed class ExpenseStateBloc {}

final class ExpenseInitialState extends ExpenseStateBloc{}
final class ExpenseLoadingState extends ExpenseStateBloc{}
final class ExpenseLoadedState extends ExpenseStateBloc{
  List<ExpenseDataModel> expModel;
  ExpenseLoadedState({required this.expModel});
}

final class ExpenseFilterLoadedState extends ExpenseStateBloc{
  List<ExpenseFilterModel> mFilteredExpense;
  num bal;
  ExpenseFilterLoadedState({required this.mFilteredExpense, required this.bal});
}

final class ExpenseErrorState extends ExpenseStateBloc{
  String errorMessage;
  ExpenseErrorState({required this.errorMessage});
}