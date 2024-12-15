import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:websocket/Add%20to%20Cart/button.dart';
import 'package:websocket/Cart/myContainer.dart';
import 'package:websocket/sommeList.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    int index = 1;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Shopping Cart", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 17),
            child: Stack(
            clipBehavior: Clip.none,
              
              children: [
                Icon(Icons.shopping_cart_rounded, color: Colors.white,),
                Positioned(
                  left: 11,
                  top: -7,
                  child: 
                Container(
                  height: 18,width: 18,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(44)

                  ),padding: EdgeInsets.all(0),
                  child: Align(alignment: Alignment.center,
                    child: Consumer<sommList>(builder: (context, pv, child){
                      return Text("${pv.count}", style: TextStyle(color: Colors.white, fontSize: 14),);
                    }))))
              ],
            ),
          )
        ],
      ),
      
      body: Provider.of<sommList>(context).count ==0 ? Center(
        child: Column(
          
          children: [
            SizedBox(height: 95,),
       //   Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQB1YTxiHcYw3CuOMZmvID4Y6ii_ngwa6tu7A&s"),
       Lottie.asset("Lottie/Animation3.json", height: 250, width: 250),
          SizedBox(height: 83,),
          Text("Your cart is empty", style: TextStyle(
            color: Colors.black, fontSize: 22
          ),)
        ],),
      ) : Column(
        children: [
          Container(
            height: 640,
            child: Consumer<sommList>(builder: (context, pvd, child){
              return ListView.builder(
                itemCount: pvd.list2.length,
                itemBuilder: (context, i){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                child: myContainer(
                  name1: pvd.list2[i].title,
                  name2: '${pvd.list2[i].prix} MRU',
                  img: pvd.list2[i].image,
                  name3: "${pvd.list2[i].quantity}",
                  onPressed3: (){
                    pvd.quantity(index);
                  },
                  onPressed2: (){
                    pvd.quantity2(index);
                  },
                  onPressed: (){
              pvd.remove(pvd.list2[i]);
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Supprime !", style: TextStyle(
                  color: Colors.white
                ),),
                )
                )  ;
            
                  },
                )
              );
            });
            }),
          ),
         Consumer<sommList>(builder: (context, prvd, child){
          return  Padding(
            padding: const EdgeInsets.only(left: 11, right: 11),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Prix Total :", style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17
                ),),
                Text(" ${prvd.prixTotal} MRU", style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17
                ),),
              ],
            ),
          );
         }),
         SizedBox(height: 11,),
     MaterialButton(
      color: Colors.blue, textColor: Colors.white,
      onPressed: (){
           
     }, child: Text("Payer"),)
        ],
      )
    );
  }
}