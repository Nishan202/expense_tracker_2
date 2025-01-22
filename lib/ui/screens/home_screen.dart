import 'package:expense_tracker_2/domain/app_routes.dart';
import 'package:expense_tracker_2/ui/screens/notification_screen.dart';
import 'package:expense_tracker_2/ui/screens/statistics_screen.dart';
import 'package:expense_tracker_2/ui/widgets/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_2/domain/asset_management.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> monthDropdownMenu = <String>['This Month', 'February', 'March', 'April'];
  List<Map<String, dynamic>> expenseList = [
    {
      "date": "Tuesday, 14",
      "totalAmount": -1380,
      "items": [
        {
          'icon': Icons.shopping_cart,
          // "color" : Colors.amber,
          "title": "Shop",
          "description": "Buy new clothes",
          "amount": -90,
        },
        {
          'icon': Icons.phone_iphone,
          "color": Colors.green[200],
          "title": "Electronic",
          "description": "Buy new iPhone 14",
          "amount": -190,
        },
      ],
    },
    {
      "date": "Monday, 13",
      "totalAmount": -1260,
      "items": [
        {
          'icon': Icons.card_travel,
          "color": Colors.purple[100],
          "title": "Transportation",
          "description": "Trip to Malang",
          "amount": -60,
        },
      ],
    },
    {
      "date": "Tuesday, 14",
      "totalAmount": -1380,
      "items": [
        {
          'icon': Icons.shopping_cart,
          "color": Colors.blue[200],
          "title": "Shop",
          "description": "Buy new clothes",
          "amount": -90,
        },
        {
          'icon': Icons.phone_iphone,
          "color": Colors.red[100],
          "title": "Electronic",
          "description": "Buy new iPhone 14",
          "amount": -190,
        },
      ],
    },
  ];
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
      body: Padding(
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
                  // inputDecorationTheme: InputDecorationTheme(fillColor: Colors.indigo[100], focusColor: Colors.green, outlineBorder: BorderSide(width: 2, style: BorderStyle.solid)),
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
              child: ListView.builder(
                itemCount: expenseList.length,
                itemBuilder: (_, index) {
                  return ExpenseItem(
                    date: expenseList[index]['date'],
                    totalAmount: expenseList[index]['totalAmount'].toString(),
                    expenseItemDetails: expenseList[index]['items'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
