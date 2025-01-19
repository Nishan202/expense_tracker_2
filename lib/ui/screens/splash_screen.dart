import 'dart:async';
import 'package:expense_tracker_2/domain/app_routes.dart';
import 'package:expense_tracker_2/domain/asset_management.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.HOME_SCREEN_ROUTE);
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
              Assets.splash_screen_img,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Easy way to monitor your expense', style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),),
            const SizedBox(
              height: 15,
            ),
            const Text('Safe your future by managing your expense right now', style: TextStyle(fontSize: 20, color: Colors.grey),)
          ],
        ),
      ),
    );
  }
}
