import 'package:expense_tracker_2/screens/home_screen.dart';
import 'package:expense_tracker_2/screens/notification_screen.dart';
import 'package:expense_tracker_2/screens/splash_screen.dart';
import 'package:expense_tracker_2/screens/statistics_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static final String SPLASH_SCREEN_ROUTE = '/splash';
  static final String HOME_SCREEN_ROUTE = '/home';
  // static final String LOGIN_SCREEN_ROUTE = '/login';
  static final String NOTIFICATION_SCREEN_ROUTE = '/notification';
  static final String STATISTICS_SCREEN_ROUTE = '/statistics';

  static Map<String, WidgetBuilder> pageRoute = {
    SPLASH_SCREEN_ROUTE : (_) => SplashScreen(),
    HOME_SCREEN_ROUTE : (_) => HomeScreen(),
    NOTIFICATION_SCREEN_ROUTE : (_) => NotificationScreen(),
    STATISTICS_SCREEN_ROUTE : (_) => StatisticsScreen(),
    // LOGIN_SCREEN_ROUTE : (_) => LoginScreen(),
  };
}