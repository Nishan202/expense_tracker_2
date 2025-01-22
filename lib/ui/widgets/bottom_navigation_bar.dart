import 'package:expense_tracker_2/ui/screens/add_expense_screen.dart';
import 'package:expense_tracker_2/ui/screens/home_screen.dart';
import 'package:expense_tracker_2/ui/screens/notification_screen.dart';
import 'package:expense_tracker_2/ui/screens/profile_screen.dart';
import 'package:expense_tracker_2/ui/screens/statistics_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentPageIndex = 0;
  List<Widget> navPages = [
    HomeScreen(),
    StatisticsScreen(),
    AddExpenseScreen(),
    NotificationScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navPages[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
            selectedIcon: Icon(Icons.home, color: Colors.black,),
            icon: Icon(Icons.home_outlined,),
            label: 'Home',
          ),
          NavigationDestination(
            // selectedIcon: Icon(Icons.bar_chart_rounded, color: Colors.black,),
            icon: Icon(Icons.bar_chart_rounded),
            label: 'Statistics',
          ),
          NavigationDestination(
            icon: Icon(Icons.add),
            label: 'Add item',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.notifications, color: Colors.black,),
            icon: Icon(Icons.notifications_outlined),
            label: 'Notification',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person, color: Colors.black,),
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        selectedIndex: currentPageIndex,
        backgroundColor: Colors.indigo[100],
        // shadowColor: Colors.cyanAccent,
        onDestinationSelected: (value){
          setState(() {
            currentPageIndex = value;
          });
        },
      ),
    );
  }
}
