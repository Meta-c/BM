import 'package:flutter/material.dart';

class layout extends StatelessWidget {
  layout({
    required this.colour,
    required this.cardChild,
  });

  late Color colour;
  late Widget cardChild;
  //Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 200.0,
      width: 170.0,
    );
  }
}
