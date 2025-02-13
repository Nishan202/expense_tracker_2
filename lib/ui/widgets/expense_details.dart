import 'dart:math';

import 'package:expense_tracker_2/data/remote/models/expense_data_model.dart';
import 'package:expense_tracker_2/data/remote/models/expense_filter_model.dart';
import 'package:flutter/material.dart';

class ExpenseDetails extends StatelessWidget {
  final Image imageIcon;
  // final Color? color;
  final String title;
  final String description;
  final num amount;
  const ExpenseDetails(
      {super.key,
      required this.imageIcon,
      // this.color,
      required this.title,
      required this.description,
      required this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              // color: color ?? Colors.white30,
              color: Colors.primaries[Random().nextInt(Colors.primaries.length-1)].shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: imageIcon,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Text(
            '\$$amount',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.green[400]
            ),
          ),
        ],
      ),
    );
  }
}
