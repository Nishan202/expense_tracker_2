import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier{
  int _index = 0;

  // events
  int get navIndex => _index;
  
  set navIndex(int index){
    _index = index;
    notifyListeners();
  }
}