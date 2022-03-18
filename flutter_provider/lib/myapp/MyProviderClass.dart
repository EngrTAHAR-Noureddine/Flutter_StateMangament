import 'package:flutter/material.dart';

class MyProvider with ChangeNotifier{

  int number =0;

  void addNumber(){
    this.number++;
    print(number);
    notifyListeners();
  }

}