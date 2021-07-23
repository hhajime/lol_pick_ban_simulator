import 'package:flutter/material.dart';

class PickBanProvider extends ChangeNotifier {
  int _count = 0;
  void listen() {
    _count++;
    notifyListeners();
  }
}
