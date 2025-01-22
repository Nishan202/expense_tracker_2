import 'package:expense_tracker_2/ui/screens/home_screen.dart';
import 'package:expense_tracker_2/ui/screens/login_screen.dart';
import 'package:expense_tracker_2/ui/screens/notification_screen.dart';
import 'package:expense_tracker_2/ui/screens/registration_screen.dart';
import 'package:expense_tracker_2/ui/screens/splash_screen.dart';
import 'package:expense_tracker_2/ui/screens/statistics_screen.dart';
import 'package:expense_tracker_2/ui/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String SPLASH_SCREEN_ROUTE = '/splash';
  static const String BOTTOM_NAVIGATION_BAR = '/';
  static const String HOME_SCREEN_ROUTE = '/home';
  static const String LOGIN_SCREEN_ROUTE = '/login';
  static const String REGISTRATION_SCREEN_ROUTE = '/registration';
  static const String NOTIFICATION_SCREEN_ROUTE = '/notification';
  static const String STATISTICS_SCREEN_ROUTE = '/statistics';

  static Map<String, WidgetBuilder> pageRoute = {
    SPLASH_SCREEN_ROUTE : (_) => SplashScreen(),
    BOTTOM_NAVIGATION_BAR : (_) => BottomNavigation(),
    HOME_SCREEN_ROUTE : (_) => HomeScreen(),
    NOTIFICATION_SCREEN_ROUTE : (_) => NotificationScreen(),
    STATISTICS_SCREEN_ROUTE : (_) => StatisticsScreen(),
    LOGIN_SCREEN_ROUTE : (_) => LoginScreen(),
    REGISTRATION_SCREEN_ROUTE : (_) => RegistrationScreen()
  };
}