import 'package:flutter/cupertino.dart';

class AboutProvider with ChangeNotifier{

  int number = 0;

   void addNumber(){
     number++;
     notifyListeners();
   }

}