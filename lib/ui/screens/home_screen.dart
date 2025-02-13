import 'package:expense_tracker_2/data/remote/models/expense_data_model.dart';
import 'package:expense_tracker_2/data/remote/models/expense_filter_model.dart';
import 'package:expense_tracker_2/data/remote/models/user_data_model.dart';
import 'package:expense_tracker_2/data/state_management/auth/signup_bloc.dart';
import 'package:expense_tracker_2/data/state_management/auth/signup_state_bloc.dart';
import 'package:expense_tracker_2/data/state_management/expense/expense_bloc.dart';
import 'package:expense_tracker_2/data/state_management/expense/expense_event_bloc.dart';
import 'package:expense_tracker_2/data/state_management/expense/expense_state_bloc.dart';
import 'package:expense_tracker_2/ui/widgets/expense_details.dart';
import 'package:expense_tracker_2/ui/widgets/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_2/domain/asset_management.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<String> monthDropdownMenu = <String>['Date wise', 'Month wise', 'Year wise']; // for expense type
  String selectedFilter = "Date wise";
  List<ExpenseFilterModel> filteredExpenses = [];
  DateFormat df = DateFormat.yMMMd();

/*
// Filter data date wise
  void filterExpenseDatewise({required List<ExpenseDataModel> expenses}){
  // when this function will call then first clear previous data from the list
  filteredExpenses.clear();

  // filter unique date
  List<String> uniqueDates = [];
  for(ExpenseDataModel eachExp in expenses){
    String eachDate = df.format(DateTime.fromMillisecondsSinceEpoch(int.parse(eachExp.date)));
    if(!uniqueDates.contains(eachDate)){
      uniqueDates.add(eachDate);
    }
  }

  print(uniqueDates);

  // check each date expenses
  for(String eachDate in uniqueDates){
    num balance = 0.0;
    List<ExpenseDataModel> eachDateExp = []; // will add each date expense in this list
    for(ExpenseDataModel eachExp in expenses){
      String eachExpDate = df.format(DateTime.fromMillisecondsSinceEpoch(int.parse(eachExp.date)));
      if(eachExpDate == eachDate){
        eachDateExp.add(eachExp);

        if(eachExp.expenseType == 'Debit'){
          balance = balance - eachExp.amount;
        } else{
          balance = balance + eachExp.amount;
        }
      }
    }
    
    print('each date : $eachDate');
    print('balance : $balance');
    print('items : ${eachDateExp.length}');

    filteredExpenses.add(ExpenseFilterModel(expenseType: eachDate, balance: balance, allExpense: eachDateExp,));
  }
}

*/

  @override
  void initState() {
    super.initState();
    context.read<ExpenseBloc>().add(FetchFilteredExpenses(filterType: 0));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.monetization_on, color: Colors.blue[800]),
                SizedBox(width: 8),
                Text(
                  'Expense',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            // IconButton(
            //   onPressed: () {},
            //   icon: Icon(
            //     Icons.search,
            //     color: Colors.black,
            //   ),
            // ),
          ],
        ),
      ),
      body: BlocBuilder<SignupBloc, SignupStateBloc>(builder: (ctx, state){
        List<UserDataModel> allData = state.uModel;
        return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User profile section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      child: Image.asset(
                        Assets.splash_screen_img,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Morning',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Nishan',
                          // allData[index].name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                DropdownButton<String>(
                  value: selectedFilter,
                  onChanged: (String? newValue) {
                    int selectedType=0;
                    if(newValue=="Date wise"){
                      selectedType=0;
                    } else if(newValue=="Month wise"){
                      selectedType=1;
                    } else if(newValue=="Year wise") {
                      selectedType=2;
                    } else {
                      selectedType=3;
                    }
                    context.read<ExpenseBloc>().add(FetchFilteredExpenses(filterType: selectedType));
                    setState(() {
                      selectedFilter = newValue!;
                    });
                  },
                  items: <String>["Date wise", "Month wise", "Year wise"].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                // DropdownMenu(
                //   menuStyle: const MenuStyle(
                //       // fixedSize: WidgetStatePropertyAll(Size.fromHeight(30)),
                //         backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 185, 193, 235))),
                //     inputDecorationTheme: InputDecorationTheme(fillColor: Color.fromARGB(255, 144, 159, 242),
                //         filled: true,
                //         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                //   initialSelection: monthDropdownMenu[0],
                //   dropdownMenuEntries: monthDropdownMenu.map((value) {
                //     return DropdownMenuEntry(value: value, label: value);
                //   }).toList(),
                //   // onSelected: context.read<ExpenseBloc>().add(FetchFilteredExpenses(filterType: 0)),
                // )
              ],
            ),
            const SizedBox(
              height: 24,
            ),

            // Expense Summary Card
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF4C61DB),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Expense total',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '\$3,734',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Color(0xFFFF6464),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              '+\$240',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'than last month',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(
                    Icons.monetization_on,
                    color: Colors.white,
                    size: 90,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Expense List',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: BlocBuilder<ExpenseBloc, ExpenseStateBloc>(builder: (ctx, state){
                if(state is  ExpenseLoadingState){
                  return Center(child: CircularProgressIndicator(),);
                }

                if(state is ExpenseErrorState){
                  return Center(child: Text(state.errorMessage),);
                }

                if(state is ExpenseFilterLoadedState){
                  // filterExpenseDatewise(expenses: state.expModel);
                  List<ExpenseFilterModel> allExpenses = state.mFilteredExpense;
                  return allExpenses.isNotEmpty ? ListView.builder(itemCount: allExpenses.length, itemBuilder: (_ , index){
                    // final expense = allExpenses[index];
                    return ExpenseItem(date: allExpenses[index].expenseType, totalAmount: allExpenses[index].balance, expenseItemDetails: allExpenses[index].allExpense);
                  }) : const Center(child: Text('No expenses yet!!, Please add expenses'),);
                }
                // If above if condition are fails then we execute empty container
                return Container();
              }),
            ),
          ],
        ),
      );
      })
    );
  }
}
