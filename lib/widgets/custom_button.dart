import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Function(int) onButtonPressed;

  const CustomButton({Key? key, required this.onButtonPressed})
      : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  List<Color> buttonColors = List.generate(6, (index) => Colors.white);
  List<String> dayNames = ["Pzt", "Sal", "Çrş", "Per", "Cum", "Cmt"];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (int i = 0; i < 6; i++)
              Padding(
                padding: const EdgeInsets.only(right: 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: buttonColors[i],
                  ),
                  onPressed: () {
                    setState(() {
                      for (int j = 0; j < buttonColors.length; j++) {
                        buttonColors[j] = Colors.white;
                      }

                      buttonColors[i] = Colors.red;

                      widget.onButtonPressed(i);
                    });
                  },
                  child: Center(
                    child: Text(
                      dayNames[i],
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
