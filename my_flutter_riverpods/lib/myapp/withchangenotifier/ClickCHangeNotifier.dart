import 'package:flutter/cupertino.dart';

class ClickChangeNotifier with ChangeNotifier{

  int click = 0;
  void increment(){
    click++;
    notifyListeners();
  }
}