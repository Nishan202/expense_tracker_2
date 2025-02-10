import 'package:expense_tracker_2/data/database/db_helper.dart';
import 'package:expense_tracker_2/data/remote/models/expense_data_model.dart';
import 'package:expense_tracker_2/data/state_management/expense/expense_event_bloc.dart';
import 'package:expense_tracker_2/data/state_management/expense/expense_state_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpenseBloc extends Bloc<ExpenseEventBloc, ExpenseStateBloc>{
  DBHelper dbHelper;
  ExpenseBloc({required this.dbHelper}) : super(ExpenseInitialState()){
    on<FetchInitialExpenses>((event, emit) async {
      emit(ExpenseLoadingState());
      List<ExpenseDataModel> allExpenses = await dbHelper.fetchAllExpenses();
      emit(ExpenseLoadedState(expModel: allExpenses));
    });

    on<AddExpenseData>((event, emit) async {
      emit(ExpenseLoadingState());
      bool check = await dbHelper.addExpense(newExpense: event.expenses);
      if(check){
        List<ExpenseDataModel> allExpenses = await dbHelper.fetchAllExpenses();
        emit(ExpenseLoadedState(expModel: allExpenses));
      } else{
        emit(ExpenseErrorState(errorMessage: "Expense not added"));
      }
    });
  }
}