import 'package:dogus_app/const/customScroll.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final ScrollController? scrollController;
  final double? bottomSheetOffset;

  const Profile({
    Key? key,
    this.scrollController,
    this.bottomSheetOffset,
  }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: ListView(
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  // Kapatma işlemi
                  Navigator.pop(context);
                },
                child: Icon(Icons.close),
              ),
            ),
            // Diğer içerikler buraya eklenebilir
          ],
        ),
      ),
    );
  }
}

