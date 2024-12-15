import 'package:flutter/material.dart';

class formWidget extends StatelessWidget {
 final TextEditingController? mycontroller;
  const formWidget({super.key, this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller:mycontroller ,
      decoration: InputDecoration(
        hintText: "Entrer ton message",
        labelStyle: TextStyle(

        ),
        border: OutlineInputBorder()
      ),
    );
  }
}