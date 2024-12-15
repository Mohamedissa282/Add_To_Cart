import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Pageview1 extends StatelessWidget {
  final String img;
  const Pageview1({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.only(left: 88),
                child: Lottie.asset("Lottie/orange.json", height: 200, width: 300,),
              );
  }
}