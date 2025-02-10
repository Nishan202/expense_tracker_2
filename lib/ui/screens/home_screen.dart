import 'dart:math';

import 'package:expense_tracker_2/data/remote/models/expense_data_model.dart';
import 'package:expense_tracker_2/data/remote/models/user_data_model.dart';
import 'package:expense_tracker_2/data/state_management/auth/signup_bloc.dart';
import 'package:expense_tracker_2/data/state_management/auth/signup_state_bloc.dart';
import 'package:expense_tracker_2/data/state_management/expense/expense_bloc.dart';
import 'package:expense_tracker_2/data/state_management/expense/expense_event_bloc.dart';
import 'package:expense_tracker_2/data/state_management/expense/expense_state_bloc.dart';
import 'package:expense_tracker_2/domain/app_routes.dart';
import 'package:expense_tracker_2/ui/screens/notification_screen.dart';
import 'package:expense_tracker_2/ui/screens/statistics_screen.dart';
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
  List<String> monthDropdownMenu = <String>['This Month', 'February', 'March', 'April'];
  DateFormat df = DateFormat.yMMMd();
  // List<Map<String, dynamic>> expenseList = [
  //   {
  //     "date": "Tuesday, 14",
  //     "totalAmount": -1380,
  //     "items": [
  //       {
  //         'icon': Icons.shopping_cart,
  //         // "color" : Colors.amber,
  //         "title": "Shop",
  //         "description": "Buy new clothes",
  //         "amount": -90,
  //       },
  //       {
  //         'icon': Icons.phone_iphone,
  //         "color": Colors.green[200],
  //         "title": "Electronic",
  //         "description": "Buy new iPhone 14",
  //         "amount": -190,
  //       },
  //     ],
  //   },
  //   {
  //     "date": "Monday, 13",
  //     "totalAmount": -1260,
  //     "items": [
  //       {
  //         'icon': Icons.card_travel,
  //         "color": Colors.purple[100],
  //         "title": "Transportation",
  //         "description": "Trip to Malang",
  //         "amount": -60,
  //       },
  //     ],
  //   },
  //   {
  //     "date": "Tuesday, 14",
  //     "totalAmount": -1380,
  //     "items": [
  //       {
  //         'icon': Icons.shopping_cart,
  //         "color": Colors.blue[200],
  //         "title": "Shop",
  //         "description": "Buy new clothes",
  //         "amount": -90,
  //       },
  //       {
  //         'icon': Icons.phone_iphone,
  //         "color": Colors.red[100],
  //         "title": "Electronic",
  //         "description": "Buy new iPhone 14",
  //         "amount": -190,
  //       },
  //     ],
  //   },
  // ];

  @override
  void initState() {
    super.initState();
    context.read<ExpenseBloc>().add(FetchInitialExpenses());
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
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
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
                // DropdownButton<String>(
                //   value: dropDownValue,
                //   items: month.map<DropdownMenuItem<String>>((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value),
                //     );
                //   }).toList(),
                //   onChanged: (value) {
                //     setState(() {
                //       dropDownValue = value!;
                //     });
                //   },
                // ),
                DropdownMenu(
                  menuStyle: const MenuStyle(
                      // fixedSize: WidgetStatePropertyAll(Size.fromHeight(30)),
                        backgroundColor: WidgetStatePropertyAll(
                            Color.fromARGB(255, 185, 193, 235))),
                    inputDecorationTheme: InputDecorationTheme(
                        fillColor: Color.fromARGB(255, 144, 159, 242),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  initialSelection: monthDropdownMenu[0],
                  dropdownMenuEntries: monthDropdownMenu.map((value) {
                    return DropdownMenuEntry(value: value, label: value);
                  }).toList(),
                )
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
              // child: ListView.builder(
              //   itemCount: expenseList.length,
              //   itemBuilder: (_, index) {
              //     return ExpenseItem(
              //       date: expenseList[index]['date'],
              //       totalAmount: expenseList[index]['totalAmount'].toString(),
              //       expenseItemDetails: expenseList[index]['items'],
              //     );
              //   },
              // ),
              child: BlocBuilder<ExpenseBloc, ExpenseStateBloc>(builder: (ctx, state){
                // List<ExpenseDataModel> allExpenses = state.expModel;
                // return allExpenses.isNotEmpty ? ListView.builder(itemCount: allExpenses.length, itemBuilder: (_ , index){
                //   return ExpenseItem(date: allExpenses[index].date.toString(), totalAmount: allExpenses[index].amount.toString(), expenseItemDetails: ExpenseDetails(icon: icon, title: title, description: description, amount: amount))
                // }) : Center(child: Text('No expenses yet!!, Please add expenses'),);
                if(state is  ExpenseLoadingState){
                  return Center(child: CircularProgressIndicator(),);
                }

                if(state is ExpenseErrorState){
                  return Center(child: Text(state.errorMessage),);
                }

                if(state is ExpenseLoadedState){
                  List<ExpenseDataModel> allExpenses = state.expModel;
                  return allExpenses.isNotEmpty ? ListView.builder(itemCount: allExpenses.length, itemBuilder: (_ , index){
                    final expense = allExpenses[index];
                    // return ExpenseItem(date: expense.date, totalAmount: expense.balance.toString(), expenseItemDetails: ExpenseDetails(icon: Image.asset(CategoryIcons.mCategory.where((eachCat){
                    //   return eachCat.cId == expense.categoryId;
                    // }).toList()[0].imageIcon), title: title, description: description, amount: amount));
                    return ExpenseItem(date: df.format(DateTime.fromMillisecondsSinceEpoch(int.parse(expense.date))), totalAmount: expense.balance.toString(),);
                  }) : const Center(child: Text('No expenses yet!!, Please add expenses'),);
                }

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
