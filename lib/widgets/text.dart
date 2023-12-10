import 'package:flutter/material.dart';

class ColumnTextWidget extends StatelessWidget {
  final String title;
  final String describe;
  final double size;

  const ColumnTextWidget(
      {Key? key, required this.title, this.size = 14, this.describe = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.white60, fontSize: size),
        ),
        Text(
          describe,
          style: TextStyle(color: Colors.white, fontSize: size),
        ),
      ],
    );
  }
}
