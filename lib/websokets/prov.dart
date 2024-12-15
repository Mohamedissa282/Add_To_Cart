import 'package:flutter/material.dart';

class test2 extends ChangeNotifier{
  String? myText ;
 void  addText(String txt ){
      myText = txt;
      notifyListeners();
  }
  List<Test3> get listTwo => list; 
  List<Test3> list = [];
  void addTitle(Test3 test3){
      list.add(test3);
      notifyListeners();
  }
  int get countList{
    return listTwo.length;
  }
}


class Test3{
final String title;
 Test3({required this.title});
}