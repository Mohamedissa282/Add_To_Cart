import 'package:flutter/material.dart';

class myContainer extends StatelessWidget {
  final String name1;
  final String name2;
   final String name3;
  final String img;
 final void Function()? onPressed;
 final void Function()? onPressed2;
 final void Function()? onPressed3;
  const myContainer({super.key, required this.name1, required this.name2, required this.img, this.onPressed, this.onPressed2, this.onPressed3, required this.name3});

  @override
  Widget build(BuildContext context) {
    return Stack(
      
      children: [
        Container(
          
          height: 127,
          decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(3),
             boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(2, 2),
                blurRadius: 9, blurStyle: BlurStyle.normal,
                spreadRadius: 2.0
              )
             ]

          ),
         
          
        ),
        
        Positioned(
          left: 4,
          bottom: 40,
          child: Image.network(img, width: 100,)),
        Positioned(
          left: 114,
          bottom: 70,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Text(name1, style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500
            ),),
            Text(name2, style: TextStyle(
              color: Colors.black, fontSize: 16
            ),),
          ],),
          
        ),
        Positioned(left: 307,
          child: IconButton(onPressed: onPressed, icon: Icon(Icons.delete, size: 29,))),
        
          Positioned(
            left: 230,
            bottom: 20,
            child: Container(
              decoration: BoxDecoration(
               color: Colors.green[500],
               borderRadius: BorderRadius.circular(5)
              ),
              
              height: 40,width: 110,
              
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  InkWell(
                    onTap: onPressed2,
                    child: Icon(Icons.remove, color: Colors.white,size: 28,)),
                  Text(name3, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          InkWell(
            onTap: onPressed3,
            child: Icon(Icons.add, color: Colors.white,size: 28,))
                ],
              ),
            ),
          )
      ],
    )
    
    ;
  }
}