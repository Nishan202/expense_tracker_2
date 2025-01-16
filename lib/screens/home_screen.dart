import 'package:expense_tracker_2/widgets/expense_details.dart';
import 'package:expense_tracker_2/widgets/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_2/utils/asset_management.dart';

const List<String> month = <String>['This Month', 'February', 'March', 'April'];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dropDownValue = month.first;
  List<Map<String, dynamic>> expenseList = [
    {
      "date": "Tuesday, 14",
      "total": -1380,
      "items": [
        {
          "category": "Shop",
          "description": "Buy new clothes",
          "amount": -90,
        },
        {
          "category": "Electronic",
          "description": "Buy new iPhone 14",
          "amount": -1290,
        },
      ],
    },
    {
      "date": "Monday, 13",
      "total": -60,
      "items": [
        {
          "category": "Transportation",
          "description": "Trip to Malang",
          "amount": -60,
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
            IconButton(onPressed: (){}, icon: Icon(Icons.search, color: Colors.black,)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
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
                DropdownButton<String>(
                  value: dropDownValue,
                  items: month.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      dropDownValue = value!;
                    });
                  },
                ),
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
              child: Column(
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
            SizedBox(height: 8),
            // Expanded(
            //   child: ListView.builder(
            //       itemCount: 2,
            //       itemBuilder: (_, builder) {
            //         return ExpenseItem(
            //             title: 'shop', desc: 'Buy new clothes', amount: '\$80');
            //       }),
            // )
            Expanded(child: ListView.builder(itemCount: 2, itemBuilder: (_ , index){
              return ExpenseItem(
                date: 'Tuesday, 14',
                amount: '-\$1380',
                
              );
            }))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}
