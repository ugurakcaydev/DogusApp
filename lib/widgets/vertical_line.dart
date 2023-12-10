import 'package:flutter/material.dart';

class VerticalLine extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  const VerticalLine({Key? key,this.width=1,this.height=35,this.color=Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color,
    );
  }
}
