import 'package:expense_tracker_2/data/remote/models/expense_data_model.dart';
import 'package:expense_tracker_2/domain/asset_management.dart';
import 'package:expense_tracker_2/ui/widgets/expense_details.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  // List<Map<String, dynamic>> expenseItemDetails;
  List<ExpenseDataModel> expenseItemDetails;
  String date;
  num totalAmount;
  ExpenseItem(
      {super.key,
      required this.date,
      required this.totalAmount,
      required this.expenseItemDetails});

  @override
  Widget build(BuildContext context) {
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
                    color:
                        totalAmount < 0 ? Colors.red[400] : Colors.green[400],
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
              // itemCount: state.expModel.length,
              itemCount: expenseItemDetails.length,
              itemBuilder: (_, index) {
                // final expense = state.expModel[index];
                return ExpenseDetails(
                    imageIcon: Image.asset(CategoryIcons.mCategory.where((eachCat) {
                          return eachCat.cId == expenseItemDetails[index].categoryId;
                        }).toList()[0].imageIcon),
                    // color: expenseItemDetails[index]['color'],
                    title: expenseItemDetails[index].title,
                    description: expenseItemDetails[index].description,
                    amount: expenseItemDetails[index].amount);
              },
            )
          ],
        ),
      ),
    );
  }
}
