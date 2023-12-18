import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dogus_app/controller/controller.dart';
import 'package:dogus_app/pages/quickmenu.dart';
import 'package:dogus_app/pages/home.dart';
import 'package:dogus_app/pages/AlinanDersler.dart';
import 'package:dogus_app/pages/profile.dart';
import 'package:dogus_app/pages/setting.dart';

import 'package:dogus_app/server/data/itemQuickMenu.dart';

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
      body: GetBuilder<NavBarController>(builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.black54,
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                Home(),
                Note(),
                Quickmenu(items: quickMenuItems),
                Setting(),
                Profile()
              ],
            ),
          ),
          bottomNavigationBar: CurvedNavigationBar(
            height: 60,
            items: [
              _bottombarItem(Icons.home, 25),
              _bottombarItem(Icons.school_sharp, 25),
              _bottombarItem(Icons.show_chart, 25),
              _bottombarItem(Icons.settings, 25),
              _bottombarItem(Icons.man, 25)
            ],
            backgroundColor: Colors.black54,
            animationDuration: Duration(milliseconds: 300),
            color: Colors.black87,
            index: controller.tabIndex,
            onTap: (index) {
              if (index == 2) {
                // QuickMenu'nun index'i
                showFlexibleBottomSheet(
                    minHeight: 0, // Değiştirin: 0 olarak ayarlandı
                    initHeight: 1,
                    maxHeight: 1,
                    context: context,
                    builder: (BuildContext context,
                        ScrollController scrollController, double offset) {
                      return Quickmenu(
                        items: quickMenuItems,
                        bottomSheetOffset: offset,
                        scrollController: scrollController,
                      );
                    },
                    anchors: [0, 1],
                    isSafeArea: true,
                    isDismissible: false,//windows'ta çalışmıyor ama emülatör de çalışıyor
                    isModal: true);
                // showModalBottomSheet(
                //   context: context,
                //   builder: (context) {
                //     return QuickMenu(); // BottomSheet'in içeriği
                //   },
                // );
              } else {
                controller.changeTabIndex(index);
              }
            },
          ),
        );
      }),
    );
  }

  // void _showChartBottomSheet(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (BuildContext sheetContext) {
  //       // BottomSheet içeriği buraya gelecek
  //       return Container(
  //         child: Text('Bu bir BottomSheet!'),
  //       );
  //     },
  //   );
  // }
}

Widget _bottombarItem(IconData icon, double size) {
  return Container(
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      // Set the desired color for the icon
    ),
    child: Icon(icon, size: size, color: Colors.white), // Set the icon color
  );
}
