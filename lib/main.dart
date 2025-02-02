import 'package:expense_tracker_2/data/database/db_helper.dart';
import 'package:expense_tracker_2/data/state_management/auth/signup_bloc.dart';
import 'package:expense_tracker_2/domain/app_routes.dart';
import 'package:expense_tracker_2/ui/screens/home_screen.dart';
import 'package:expense_tracker_2/ui/screens/login_screen.dart';
import 'package:expense_tracker_2/ui/screens/registration_screen.dart';
import 'package:expense_tracker_2/ui/screens/splash_screen.dart';
import 'package:expense_tracker_2/ui/screens/statistics_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(create: (context) => SignupBloc(dbHelper: DBHelper.getInstense()), child: const MyApp(),));
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
      initialRoute: AppRoutes.SPLASH_SCREEN_ROUTE,
      routes: AppRoutes.pageRoute,
      // home: SplashScreen(),
    );
  }
}