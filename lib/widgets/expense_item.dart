import 'package:expense_tracker_2/utils/asset_management.dart';
import 'package:expense_tracker_2/widgets/expense_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExpenseItem extends StatelessWidget {
  String date;
  String amount;
  ExpenseItem(
      {super.key,
      required this.date,
      required this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Card(
        // color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
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
                    amount,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.red[400],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Divider(color: Colors.grey[300], thickness: 1),
             
              Expanded(
                child: ListView.builder(itemBuilder: (_ , index){
                  return ExpenseDetails();
                }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _expenseSubItem(String title, String description, String amount) {
    // return ListTile(
    //   leading: Container(
    //     height: 50,
    //     width: 50,
    //     decoration: const BoxDecoration(
    //       color: Colors.redAccent,
    //       borderRadius: BorderRadius.all(Radius.circular(5)),
    //       shape: BoxShape.rectangle,
    //     ),
    //     child: Icon(Icons.shopping_cart),
    //   ),
    //   title: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
    //   subtitle: Text(description, style: TextStyle(color: Colors.grey),),
    //   trailing: Text(amount , style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
    // );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colour.componentColor,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              shape: BoxShape.rectangle,
            ),
            child: Icon(Icons.shopping_cart),
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text(description, style: TextStyle(color: Colors.grey)),
            ],
          ),
          Spacer(),
          Text(amount,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent)),
        ],
      ),
    );
  }
}
