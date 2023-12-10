import 'package:flutter/material.dart';

class Note extends StatefulWidget {
  const Note({ Key? key }) : super(key: key);

  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<Note> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Center(
        child: Text("Note"),
      ),
    );
  }
}