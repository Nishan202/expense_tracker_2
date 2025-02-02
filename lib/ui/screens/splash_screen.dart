import 'dart:async';
import 'package:expense_tracker_2/domain/app_routes.dart';
import 'package:expense_tracker_2/domain/asset_management.dart';
import 'package:expense_tracker_2/ui/screens/home_screen.dart';
import 'package:expense_tracker_2/ui/screens/login_screen.dart';
import 'package:expense_tracker_2/ui/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {

      var preference = await SharedPreferences.getInstance();
      int uid = await preference.getInt('UID') ?? 0;

      Widget navigateTo = LoginScreen();

      if(uid>0){
        // Navigator.pushReplacementNamed(context, AppRoutes.BOTTOM_NAVIGATION_BAR);
        navigateTo = BottomNavigation();
      }
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => navigateTo));
      // Navigator.pushReplacementNamed(context, AppRoutes.LOGIN_SCREEN_ROUTE);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Image.asset(
              Assets.expense_tracker_image,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Easy way to monitor your expense', style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),),
            const SizedBox(
              height: 15,
            ),
            const Text('Safe your future by managing your', style: TextStyle(fontSize: 20, color: Colors.grey),),
            const Text('expense right now', style: TextStyle(fontSize: 20, color: Colors.grey),)
          ],
        ),
      ),
    );
  }
}
