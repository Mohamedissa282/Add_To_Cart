import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:websocket/Add%20to%20Cart/ListCart.dart';
import 'package:websocket/Add%20to%20Cart/ListProv.dart';
import 'package:websocket/Cart/Cart.dart';
import 'package:websocket/sommeList.dart';
import 'package:websocket/test.dart';
import 'package:websocket/websokets/dropDown.dart';
import 'package:websocket/websokets/prov.dart';



void main() { runApp( 
  ChangeNotifierProvider(create: (context)=>sommList(),child: MyApp()  ,)
  );
   }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
    routes: {
      'cart' : (context)=> Cart()
    },
      home:listCart(),
    );
  }
}


 