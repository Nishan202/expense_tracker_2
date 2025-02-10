 import 'package:expense_tracker_2/data/remote/models/expense_data_model.dart';

sealed class ExpenseStateBloc {}

final class ExpenseInitialState extends ExpenseStateBloc{}
final class ExpenseLoadingState extends ExpenseStateBloc{}
final class ExpenseLoadedState extends ExpenseStateBloc{
  List<ExpenseDataModel> expModel;
  ExpenseLoadedState({required this.expModel});
}
final class ExpenseErrorState extends ExpenseStateBloc{
  String errorMessage;
  ExpenseErrorState({required this.errorMessage});
}