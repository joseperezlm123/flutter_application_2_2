import 'dart:math';

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
    final boxDecoration = const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end:  Alignment.bottomCenter,
          stops: [0.2, 0.9],
          colors: [
            Color.fromARGB(223, 228, 2, 59),
            Color.fromRGBO(0, 0, 0, 0.952)
          ]
        )
      );

  const Background({super.key});

      @override
      Widget build(BuildContext context){ 
    return  Stack(
      children: [
        Container(
          // Purple
          decoration: boxDecoration),
          //Pink box
          Positioned(
            top: -100,
            left: -30,
            child:
             _PinkBox()
             ),
      ],
    );
  }
}

class _PinkBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Transform.rotate(
      angle: -pi / 5,
      child: Container (
        width: 360,
        height: 360,
        decoration: BoxDecoration(
        color: Colors.pink,
          borderRadius: BorderRadius.circular(80),
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(24, 130, 138, 0.719),
            Color.fromRGBO(16, 165, 175, 1)
          ])
        ),
      ),
    );
  }
}