import 'package:flutter/material.dart';

class BusSeatViewModel extends ChangeNotifier {
  bool isChanged = false;

  changeSeatLayout() {
    isChanged = !isChanged;
    notifyListeners();
  }
}
