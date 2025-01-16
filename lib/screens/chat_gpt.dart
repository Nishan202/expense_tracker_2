import 'package:flutter/material.dart';

class ExpenseScreen extends StatelessWidget {
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
                  'Monety',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Icon(Icons.search, color: Colors.black),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Profile Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.blue[50],
                        child: Icon(Icons.person, color: Colors.blue[400]),
                      ),
                      SizedBox(width: 12),
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
                            'Błaszczyskowski',
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'This month',
                          style: TextStyle(
                            color: Colors.blue[800],
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.arrow_drop_down, color: Colors.blue[800]),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Color(0xFFFF6464),
                            borderRadius: BorderRadius.circular(8),
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
              SizedBox(height: 24),
              // Expense List
              Text(
                'Expense List',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              // Expense Items
              ExpenseItem(
                date: 'Tuesday, 14',
                amount: '-\$1380',
                items: [
                  ExpenseDetail(
                    icon: Icons.shopping_cart,
                    color: Colors.blue[400],
                    title: 'Shop',
                    subtitle: 'Buy new clothes',
                    amount: '-\$90',
                  ),
                  ExpenseDetail(
                    icon: Icons.phone_iphone,
                    color: Colors.orange[400],
                    title: 'Electronic',
                    subtitle: 'Buy new iPhone 14',
                    amount: '-\$1290',
                  ),
                ],
              ),
              ExpenseItem(
                date: 'Monday, 13',
                amount: '-\$60',
                items: [
                  ExpenseDetail(
                    icon: Icons.directions_car,
                    color: Colors.red[400],
                    title: 'Transportation',
                    subtitle: 'Trip to Malang',
                    amount: '-\$60',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // Bottom Navigation Bar
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

class ExpenseItem extends StatelessWidget {
  final String date;
  final String amount;
  final List<ExpenseDetail> items;

  const ExpenseItem({
    required this.date,
    required this.amount,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
        ...items.map((item) => item),
        SizedBox(height: 16),
        Divider(color: Colors.grey[300], thickness: 1),
      ],
    );
  }
}

class ExpenseDetail extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final String title;
  final String subtitle;
  final String amount;

  const ExpenseDetail({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color),
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
              const SizedBox(height: 10,),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
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
    );
  }
}
