import 'package:expense_tracker_2/data/database/db_helper.dart';
import 'package:expense_tracker_2/data/state_management/auth/signup_bloc.dart';
import 'package:expense_tracker_2/data/state_management/expense/expense_bloc.dart';
import 'package:expense_tracker_2/data/state_management/navigation/navigation_provider.dart';
import 'package:expense_tracker_2/domain/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

void main() {
  // This is single bloc provider
  // runApp(BlocProvider(create: (context) => SignupBloc(dbHelper: DBHelper.getInstense()), child: const MyApp(),));

  // This is Multi Bloc provider
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => SignupBloc(dbHelper: DBHelper.getInstense())),
    BlocProvider(create: (context) => ExpenseBloc(dbHelper: DBHelper.getInstense())),
    ChangeNotifierProvider(create: (context) => NavigationProvider()),
  ], child: const MyApp()));
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