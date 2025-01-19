import 'package:flutter/material.dart';

class StatisticsExpenseDetails extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final String title;
  final String amount;
  const StatisticsExpenseDetails(
      {required this.icon,
      this.color,
      required this.title,
      required this.amount});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      // child: Container(
      //   padding: const EdgeInsets.all(15.0),
      //   decoration: ShapeDecoration(
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(12.0),
      //       side: BorderSide(color: Colors.grey)
      //     ),
      //   ),
      // child: Row(
      //   children: [
      //     Container(
      //       height: 40,
      //       width: 40,
      //       decoration: BoxDecoration(
      //         color: color ?? Colors.white30,
      //         borderRadius: BorderRadius.all(Radius.circular(5)),
      //         shape: BoxShape.rectangle,
      //         border: Border.all(color: Colors.grey)
      //       ),
      //       child: Icon(icon),
      //     ),
      //     const SizedBox(width: 12),
      //     Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Text(title,
      //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      //         Text(amount,
      //             style: TextStyle(
      //                 fontSize: 16,
      //                 fontWeight: FontWeight.bold,
      //                 color: Colors.redAccent)),
      //       ],
      //     ),
      //   ],
      // ),
      // ),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: BorderSide(color: Colors.grey)),
        ),
        child: GridTileBar(
          // backgroundColor: Colors.black38,
          leading: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: color ?? Colors.white30,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.grey)),
            child: Icon(icon),
          ),
          title: Text(title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          subtitle: Text(
            amount,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent),
          ),
        ),
      ),
    );
  }
}
