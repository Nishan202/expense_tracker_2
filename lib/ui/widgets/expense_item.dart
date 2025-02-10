import 'package:expense_tracker_2/data/state_management/expense/expense_bloc.dart';
import 'package:expense_tracker_2/data/state_management/expense/expense_state_bloc.dart';
import 'package:expense_tracker_2/domain/asset_management.dart';
import 'package:expense_tracker_2/ui/widgets/expense_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpenseItem extends StatelessWidget {
  // List<Map<String, dynamic>> expenseItemDetails;
  // ExpenseDetails expenseItemDetails;
  String date;
  String totalAmount;
  ExpenseItem(
      {super.key,
      required this.date,
      required this.totalAmount,
      // required this.expenseItemDetails
    });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseBloc, ExpenseStateBloc>(builder: (ctx, state) {
      if (state is ExpenseLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is ExpenseErrorState) {
        return Center(
          child: Text(state.errorMessage),
        );
      }

      if (state is ExpenseLoadedState) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: BorderSide(color: Colors.grey)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '\$$totalAmount',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.red[400],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Divider(color: Colors.grey[300], thickness: 1),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(), // -> Prevents nested scrolling conflict
                  shrinkWrap: true, // -> Makes inner ListView take only as much height as needed
                  // itemCount: expenseItemDetails.length,
                  itemCount: state.expModel.length,
                  itemBuilder: (_, index) {
                    final expense = state.expModel[index];
                    return ExpenseDetails(
                        // imageIcon: expenseItemDetails[index]['icon'],
                        // // color: expenseItemDetails[index]['color'],
                        // title: expenseItemDetails[index]['title'],
                        // description: expenseItemDetails[index]['description'],
                        // amount: expenseItemDetails[index]['amount'].toString());
                        imageIcon: Image.asset(CategoryIcons.mCategory.where((eachCat) {
                              return eachCat.cId == expense.categoryId;
                            }).toList()[0].imageIcon),
                        // color: expenseItemDetails[index]['color'],
                        title: expense.title,
                        description: expense.description,
                        amount: expense.amount.toString());
                  },
                )
              ],
            ),
          ),
        );
      }

      return Container();
    });
  }
}
