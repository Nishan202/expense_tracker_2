import 'package:expense_tracker_2/data/database/db_helper.dart';
import 'package:expense_tracker_2/data/remote/models/expense_data_model.dart';
import 'package:expense_tracker_2/data/remote/models/expense_filter_model.dart';
import 'package:expense_tracker_2/data/state_management/expense/expense_event_bloc.dart';
import 'package:expense_tracker_2/data/state_management/expense/expense_state_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpenseBloc extends Bloc<ExpenseEventBloc, ExpenseStateBloc> {
  DBHelper dbHelper;
  DateFormat df = DateFormat.yMMMd();
  // DateFormat mf = DateFormat.yMMM();
  ExpenseBloc({required this.dbHelper}) : super(ExpenseInitialState()) {
    on<FetchInitialExpenses>((event, emit) async {
      emit(ExpenseLoadingState());
      List<ExpenseDataModel> allExpenses = await dbHelper.fetchAllExpenses();
      emit(ExpenseLoadedState(expModel: allExpenses));
    });

    on<FetchFilteredExpenses>((event, emit) async {
      emit(ExpenseLoadingState());
      List<ExpenseDataModel> allExpenses = await dbHelper.fetchAllExpenses();

      // Store Last balance in preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setDouble('lastBalance', allExpenses.last.balance);
      if(allExpenses.isNotEmpty){
        prefs.setDouble('lastBalance', allExpenses.last.balance);
      }else{
        prefs.setDouble('lastBalance', 0.0);
      }

      if(event.filterType == 0){
        df = DateFormat.yMMMd();
      } else if (event.filterType == 1) {
        df = DateFormat.yMMM();
      } else if (event.filterType == 2) {
        df = DateFormat.y();
      }
      emit(ExpenseFilterLoadedState(mFilteredExpense: filterExpense(allExpenses), bal: allExpenses.isNotEmpty ? allExpenses.last.balance : 0));
    });

    on<AddExpenseData>((event, emit) async {
      emit(ExpenseLoadingState());
      bool check = await dbHelper.addExpense(newExpense: event.expenses);
      if (check) {
        List<ExpenseDataModel> allExpenses = await dbHelper.fetchAllExpenses();
        // Store Last balance in preferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setDouble('lastBalance', allExpenses.last.balance);
        emit(ExpenseFilterLoadedState(mFilteredExpense: filterExpense(allExpenses), bal: allExpenses.isNotEmpty ? allExpenses.last.balance : 0));
      } else {
        emit(ExpenseErrorState(errorMessage: "Expense not added"));
      }
    });
  }

  // Filter data date wise
    List<ExpenseFilterModel> filterExpense(List<ExpenseDataModel> expenses) {
      List<ExpenseFilterModel> filteredExpenses = [];
      // when this function will call then first clear previous data from the list
      // filteredExpenses.clear();

      // filter unique datte
      List<String> uniqueDates = [];
      for (ExpenseDataModel eachExp in expenses) {
        String eachDate = df.format(DateTime.fromMillisecondsSinceEpoch(int.parse(eachExp.date)));
        if (!uniqueDates.contains(eachDate)) {
          uniqueDates.add(eachDate);
        }
      }

      print(uniqueDates);

      // check each date expenses
      for (String eachDate in uniqueDates) {
        num balance = 0.0;
        List<ExpenseDataModel> eachDateExp = []; // will add each date expense in this list
        for (ExpenseDataModel eachExp in expenses) {
          String eachExpDate = df.format(
              DateTime.fromMillisecondsSinceEpoch(int.parse(eachExp.date)));
          if (eachExpDate == eachDate) {
            eachDateExp.add(eachExp);

            if (eachExp.expenseType == 'Debit') {
              balance = balance - eachExp.amount;
            } else {
              balance = balance + eachExp.amount;
            }
          }
        }

        print('each date : $eachDate');
        print('balance : $balance');
        print('items : ${eachDateExp.length}');

        filteredExpenses.add(ExpenseFilterModel(
          expenseType: eachDate,
          balance: balance,
          allExpense: eachDateExp,
        ));
      }
      return filteredExpenses;
    }
}
