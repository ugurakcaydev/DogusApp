import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dogus_app/controller/controller.dart';
import 'package:dogus_app/pages/chart.dart';
import 'package:dogus_app/pages/home.dart';
import 'package:dogus_app/pages/note.dart';
import 'package:dogus_app/pages/profile.dart';
import 'package:dogus_app/pages/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final controller = Get.put(NavBarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<NavBarController>(builder: (context) {
        return Scaffold(
          backgroundColor: Colors.black54,
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: const [Home(), Note(), Chart(), Setting(), Profile()],
            ),
          ),
          bottomNavigationBar: CurvedNavigationBar(
            height: 60,
            items: [
              _bottombarItem(Icons.home, 25),
              _bottombarItem(Icons.note, 25),
              _bottombarItem(Icons.show_chart, 25),
              _bottombarItem(Icons.settings, 25),
              _bottombarItem(Icons.man, 25)
            ],
            backgroundColor: Colors.black54,
            animationDuration: Duration(milliseconds: 300),
            color: Colors.black87,
            index: controller.tabIndex,
            onTap: controller.changeTabIndex,
          ),
          // bottomNavigationBar: BottomNavigationBar(
          //   iconSize: 20,
          //   selectedItemColor: Colors.amber,
          //   unselectedItemColor: Colors.grey.shade300,
          //   currentIndex: controller.tabIndex,
          //   onTap: controller.changeTabIndex,
          //   items: [
          //     _bottombarItem(IconlyBold.home, "Home"),
          //     _bottombarItem(IconlyBold.document, "Note"),
          //     _bottombarItem(IconlyBold.chart, "Chart"),
          //     _bottombarItem(IconlyBold.setting, "Setting")
          //   ],
          // ),
        );
      }),
    );
  }
}

_bottombarItem(IconData icon, double size) {
  return Container(
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      // Set the desired color for the icon
    ),
    child: Icon(icon, size: size, color: Colors.white), // Set the icon color
  );
}
