import 'package:expense_tracker_2/domain/app_routes.dart';
import 'package:expense_tracker_2/ui/screens/home_screen.dart';
import 'package:expense_tracker_2/ui/screens/login_screen.dart';
import 'package:expense_tracker_2/ui/screens/registration_screen.dart';
import 'package:expense_tracker_2/ui/screens/statistics_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // initialRoute: AppRoutes.SPLASH_SCREEN_ROUTE,
      // routes: AppRoutes.pageRoute,
      home: RegistrationScreen(),
    );
  }
}