import 'package:flutter/material.dart';

class button extends StatelessWidget {
  final String title;
 final void Function()? onPressed;
  const button({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
                    color: Colors.red,
                    textColor: Colors.white,
                    onPressed: onPressed  , child: Text(title),);
  }
}