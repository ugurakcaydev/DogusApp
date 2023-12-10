import 'package:flutter/material.dart';

class TabBarComponent extends StatefulWidget {
  const TabBarComponent({Key? key}) : super(key: key);

  @override
  _TabBarState createState() => _TabBarState();
}

class _TabBarState extends State<TabBarComponent> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 50, right: 50, bottom: 10),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        width: 1,
        color: Colors.white,
      ))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                selectedIndex = 0;
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              padding: EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 2,
                    color: selectedIndex == 0 ? Colors.red : Colors.transparent,
                  ),
                ),
              ),
              child: Text(
                "Öğrenci",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: AutofillHints.countryCode,
                    fontSize: 15),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedIndex = 1;
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              padding: EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 2,
                    color: selectedIndex == 1 ? Colors.red : Colors.transparent,
                  ),
                ),
              ),
              child: Text(
                "İdari",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: AutofillHints.countryCode,
                    fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
