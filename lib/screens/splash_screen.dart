import 'dart:async';

import 'package:expense_tracker_2/utils/app_routes.dart';
import 'package:expense_tracker_2/utils/asset_management.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(const Duration(seconds: 3), (){
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> RegistrationScreen()));
      Navigator.pushReplacementNamed(context, AppRoutes.HOME_SCREEN_ROUTE);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(width: double.infinity, child: Column(
        children: [
          Image.asset(Assets.splash_screen_img, fit: BoxFit.cover,),
          const SizedBox(height: 20,),
          const Text('Easy way to monitor your expense'),
          const SizedBox(height: 15,),
          const Text('Safe your future by managing your expense right now')
        ],
      )),
    );
  }
}