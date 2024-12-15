import 'package:flutter/material.dart';
import 'package:websocket/pageView/pageView1.dart';
import 'package:websocket/pageView/pageView2.dart';

class details extends StatelessWidget {
  final String name;
  final String img;
  final double prix;
  const details({super.key, required this.name, required this.prix, required this.img, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        title: Text("Detials", style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: Colors.blue,
        centerTitle: true,iconTheme: IconThemeData(color: Colors.white),
      ) ,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 52,),
            Container(
              height: 160,
              width: 400,
              color: Colors.white,
              child: PageView(children: [
                Pageview1(img: img,),
                pageView2()
              ],)
            ),
            SizedBox(height: 26,),
            Align(alignment: Alignment.center,
              child: Text(name, style: TextStyle(
                color: Colors.black, fontSize: 19, fontWeight: FontWeight.w500
              ),),
            ),SizedBox(height: 12,),
            Align(alignment: Alignment.center,
              child: Text("${prix} MRU", style: TextStyle(
                color: Colors.black, fontSize: 19, fontWeight: FontWeight.w400
              ),),
            )
          ],
        ),
      ),
    );
  }
}