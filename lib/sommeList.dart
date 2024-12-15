import 'package:flutter/material.dart';
import 'package:websocket/Add%20to%20Cart/list.dart';

class sommList extends ChangeNotifier{
  int valeur = 1;
  List<listToCart> list = [];
 List<listToCart> get list2 => list;
 double prix = 0.0;
 void add(listToCart toCart){
        list.add(toCart);     
        prix+=toCart.prix;
        notifyListeners();
 }
 void remove(listToCart toCart){
      list.remove(toCart);
      prix-=toCart.prix;
      notifyListeners();
 }
 void quantity(int index){
  list2[index].quantity++;
  notifyListeners();
  
 }
 void quantity2(int index){
  
  if(list[index].quantity>1){
      list[index].quantity--;
      notifyListeners();
  }
  notifyListeners();
 }
 int get count{
   return list2.length;
 }
 double get prixTotal{
  return prix;
 }
}