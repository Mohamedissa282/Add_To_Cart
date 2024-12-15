import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({super.key});

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  late  String selected;
  void initState(){
    super.initState();
    setState(() {
      selected = 'option1';
    });
  
  }
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Drop Duwn"),
        centerTitle: true,
      ),
      body: DropdownButton(items: [
        DropdownMenuItem(child: Text("Option 1"), value: 'option1',onTap:(){
          print("Option 1");
        },),

        DropdownMenuItem(child: Text("Option 2"), value: 'option2',),

         DropdownMenuItem(child: Text("Option 2"), value: 'option3',)
      ], value:selected,   onChanged: (value){
          setState(() {
            selected = value.toString();
          });
      }),
    );
  }
}