import 'dart:io';

import 'package:flutter/material.dart';
import '../model/currentModle.dart';

class CurrentProvider with ChangeNotifier {
int currentPage=1;
int currentTab=4;

  void updateCurrentPage(int current) {
    currentPage=current;
    notifyListeners();
  }void updatecurrenttab(int index) {
    currentTab=index;
    notifyListeners();
  }


}
