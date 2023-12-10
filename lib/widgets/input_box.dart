import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputBox extends StatefulWidget {
  String labelText;
  IconData icon;
  String? type;
  TextEditingController controller;
  InputBox(
      {Key? key,
      required this.labelText,
      required this.icon,
      this.type,
      required this.controller})
      : super(key: key);

  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  FocusNode myFocusNode = FocusNode();
  bool showPassword = false;
  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: 40, vertical: 10), //horizontal = yatay, vertical=dikey,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.type == "password" ? !showPassword : false,
        showCursor: true,
        focusNode: myFocusNode,
        cursorColor: Colors.white70,
        cursorWidth: 1,
        style: TextStyle(color: Colors.white, fontSize: 14),
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          labelText: widget.labelText,
          labelStyle: TextStyle(
              color: Colors.white70, fontSize: 15, fontWeight: FontWeight.w600),
          prefixIcon: Icon(
            widget.icon,
            color: Colors.white70,
            size: 22,
          ),
          suffixIcon: widget.type == "password"
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                    // Şifreyi göster/gizle işlemleri burada yapılabilir.
                  },
                  icon: showPassword
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                  color: Colors.lightBlueAccent,
                )
              : null, // Suffix icon sadece password tipinde gösterilecek
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white70),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white70),
            borderRadius: BorderRadius.circular(5),
          ),
          contentPadding: EdgeInsets.only(
              left: 20,
              top: 8,
              right: 12,
              bottom: 8), //üste çıkan labelText'in yeri
        ),
        autovalidateMode: AutovalidateMode.always,
      ),
    );
  }
}
