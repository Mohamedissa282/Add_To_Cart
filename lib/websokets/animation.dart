import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class animation extends StatelessWidget {
  const animation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animation"),),
      body: Column(
        children: [
          Lottie.asset("Lottie/animation.json")
        ],
      ),
    );
  }
}