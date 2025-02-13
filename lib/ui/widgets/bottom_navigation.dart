import 'package:expense_tracker_2/data/state_management/navigation/navigation_provider.dart';
import 'package:expense_tracker_2/ui/screens/add_expense_screen.dart';
import 'package:expense_tracker_2/ui/screens/home_screen.dart';
import 'package:expense_tracker_2/ui/screens/notification_screen.dart';
import 'package:expense_tracker_2/ui/screens/profile_screen.dart';
import 'package:expense_tracker_2/ui/screens/statistics_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  // int currentPageIndex = 0;
  List<Widget> navPages = [
    HomeScreen(),
    StatisticsScreen(),
    AddExpenseScreen(),
    NotificationScreen(),
    ProfileScreen()
  ];

  // List<Map<String, dynamic>> navPages = [
  //   {

  //   }
  // ];
  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (_ , provider, __){
        return Scaffold(
        body: navPages[provider.navIndex],
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
              label: 'Add Expense',
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
          selectedIndex: provider.navIndex,
          backgroundColor: Colors.indigo[100],
          // shadowColor: Colors.cyanAccent,
          // onDestinationSelected: (value){
          //   setState(() {
          //     currentPageIndex = value;
          //   });
          // },
          onDestinationSelected: (index){
            setState(() {
              provider.navIndex = index;
            });
          },
          
        ),
      );
      }
    );
  }
}
