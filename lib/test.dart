import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:websocket/websokets/prov.dart';

class test extends StatelessWidget {
  const test({super.key});

  @override
  Widget build(BuildContext context) {
    String name;
    TextEditingController myController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Chat", style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold
        ),),
        backgroundColor: Colors.orange,
        leading: Icon(Icons.chat, color: Colors.white,),
        actions: [
          IconButton(onPressed: (){}, icon:Icon(Icons.close, color: Colors.white,))
        ],
      ),
      body: ListView(
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
            children: [
              Container(
                height: 654,
              
                child: Consumer<test2>(builder: (context, pvr, child){
                  return ListView.builder(itemCount: pvr.countList,
                    itemBuilder: (context, i){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical:7),
                      child: Card(child: 
                      ListTile(
                        title: Text(pvr.listTwo[i].title),
                        leading: Checkbox(value: true, onChanged: null),
                      ),)
                    );
                  });
                })
              ),
              Container(
                height: 70,
                decoration: BoxDecoration(
                      color: Colors.white,
                    border: Border(top: BorderSide(color: Colors.orange, width: 4))
                ),
              
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: TextField(
                      controller: myController,
          
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 6),
                        hintText: "Entrer un message...", 
                        border: InputBorder.none
                      ),
                    ), ),
                   
                    TextButton(onPressed: (){
                     Provider.of<test2>(context, listen: false).addTitle(Test3(title: myController.text));
                     myController.clear();
                    }, child: Text("Send", style: TextStyle(
                      color: Colors.blue, fontSize: 15, fontWeight: FontWeight.bold
                    ),))
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}