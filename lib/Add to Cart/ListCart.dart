import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:websocket/Add%20to%20Cart/button.dart';
import 'package:websocket/Add%20to%20Cart/list.dart';
import 'package:websocket/Add%20to%20Cart/listProv.dart';
import 'package:websocket/Cart/Cart.dart';
import 'package:websocket/Cart/details.dart';
import 'package:websocket/sommeList.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class listCart extends StatefulWidget {
  const listCart({super.key});

  @override
  State<listCart> createState() => _listCartState();
}

class _listCartState extends State<listCart> {
  bool _saving = false;
  int index = 0;
  void change(val){
      setState(() {
        index = val;
        
      });
      if(index==1){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Cart()));
        }
        if(index==2){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Cart()));
        }
  }
  List<listToCart> myList= [
      listToCart( title: 'Orange', image: 'https://pngimg.com/uploads/orange/orange_PNG777.png', prix: 290,quantity: 1),
      listToCart(title: 'Panan', image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKaPx7Ih2k5blFgJ7A_6HYKPPnqUyNsUXObw&s', prix: 490,quantity: 1),
      listToCart(title: 'Mango', image: 'https://e7.pngegg.com/pngimages/493/777/png-clipart-slice-of-mango-mango-tea-fruit-mango-game-food-thumbnail.png', prix: 530,quantity: 1),
      listToCart(title: 'Mango', image: 'https://e7.pngegg.com/pngimages/493/777/png-clipart-slice-of-mango-mango-tea-fruit-mango-game-food-thumbnail.png', prix: 590,quantity: 1),
    ];
  @override
  Widget build(BuildContext context) {
    
    return 
  Scaffold(
    
  backgroundColor: Colors.blue[400],
      /*bottomNavigationBar: NavigationBar(height: 60,selectedIndex: index,
      onDestinationSelected: change,
        destinations: [
          
    NavigationDestination(icon:Icon(Icons.home_outlined), label: 'homme', selectedIcon:Icon(Icons.home) ,),
     NavigationDestination(icon:Icon(Icons.category_outlined), label: 'Category', selectedIcon:Icon(Icons.category) ,),
      NavigationDestination(icon:Icon(Icons.history_outlined), label: 'History', selectedIcon:Icon(Icons.history) ,)
      ]),*/
      appBar: AppBar(
        
        title: Text("Product List", style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: Colors.blue,
       actions: [
          Padding(
            padding: const EdgeInsets.only(right: 17),
            child: Stack(
            clipBehavior: Clip.none,
              
              children: [
                IconButton(onPressed: (){
   Navigator.of(context).pushNamed('cart');
                }, icon: Icon(Icons.shopping_cart_rounded, color: Colors.white,)),
                Positioned(
                  left: 25,
                  top: 8,
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
     
      body: Container(
        
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 11),
          child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 11, mainAxisExtent: 250, mainAxisSpacing: 15),
          itemCount: myList.length,
           itemBuilder: (context, i){
            return InkWell(
              onTap: (){
    Navigator.of(context).push(MaterialPageRoute(builder: (_)=> details(name: myList[i].title, prix: myList[i].prix,img: myList[i].image,)))  ;       
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13)
                ),
                child: Consumer<sommList>(builder: (context, prv, child){
                  return Column(
                  children: [
                    
                    SizedBox(height: 8,),
                    Image.network(myList[i].image, width: 100,),
                    SizedBox(height: 10,),
                    Text("${myList[i].title}", style: TextStyle(
                      color: Colors.black, fontSize: 16
                    ),),
                    
                    SizedBox(height: 11,),
                    Padding(
                      padding: const EdgeInsets.only(right: 44),
                      child: Text("${myList[i].prix} MRU", style: TextStyle(
                        color: Colors.black, fontSize: 16
                      ),),
                    ),
                    SizedBox(height: 22,),
                    InkWell(
                      onTap: (){
                        prv.add(myList[i]);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.green[500],
                        content: Text("${myList[i].title} est ajoutee", style: TextStyle(
              color: Colors.white
                        ),),
                        )
                        )  ;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(3)
                       
                        ),
                        padding: EdgeInsets.all(7),
                        margin: EdgeInsets.only(left: 36),
                        
                        child: Text("Add to cart", style: TextStyle(
                          color: Colors.white
                        ),),
                      ),
                    )
                  ],
                );
                })
                ),
            );
            
           }
           ),
        ),
      )
    );
  }
}

