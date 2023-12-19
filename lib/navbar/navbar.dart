import 'package:dogus_app/pages/home.dart';
import 'package:dogus_app/pages/AlinanDersler.dart';

import 'package:dogus_app/pages/setting.dart';
import 'package:dogus_app/widgets/customBottomSheet.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  // final controller = Get.put(NavBarController());
  final _controller = PersistentTabController(initialIndex: 0);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      onItemSelected: (index) {
        if (index == 2 || index == 4) {
          showCustomBottomSheet(index, context, _controller, _currentIndex);
        } else {
          _currentIndex = index;
          _controller.index = index;
        }
      },
      controller: _controller,
      screens: [
        Home(),
        AlinanDersler(),
        Container(), //QuickMenu
        Setting(),
        Container() //Notifications
      ],
      items: [
        _navBarsItems(Icons.home, 22, "Ana Sayfa"),
        _navBarsItems(Icons.school_sharp, 22, "Alınan Dersler"),
        _navBarsItems(Icons.show_chart, 22, "Hızlı Menü"),
        _navBarsItems(Icons.settings, 22, "Sınav Sonuçları"),
        _navBarsItems(Icons.man, 22, "Bildirimler")
      ],
      confineInSafeArea: true,
      backgroundColor: Color(0xffc1121f), // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 500),
      ),
      navBarStyle:
          NavBarStyle.style3, // Choose the nav bar style with this property.
    );

    // return Scaffold(
    //   body: GetBuilder<NavBarController>(builder: (controller) {
    //     return Scaffold(
    //       backgroundColor: Colors.black54,
    //       body: SafeArea(
    //         child: IndexedStack(
    //           index: controller.tabIndex,
    //           children: [
    //             Home(),
    //             AlinanDersler(),
    //             Quickmenu(items: quickMenuItems),
    //             Setting(),
    //             Profile()
    //           ],
    //         ),
    //       ),
    //       bottomNavigationBar: CurvedNavigationBar(
    //         height: 60,
    //         items: [
    //           _bottombarItem(Icons.home, 25),
    //           _bottombarItem(Icons.school_sharp, 25),
    //           _bottombarItem(Icons.show_chart, 25),
    //           _bottombarItem(Icons.settings, 25),
    //           _bottombarItem(Icons.man, 25)
    //         ],
    //         backgroundColor: Colors.black54,
    //         animationDuration: Duration(milliseconds: 300),
    //         color: Colors.black87,
    //         index: controller.tabIndex,
    //         onTap: (index) {
    //           if (index == 2) {
    //             // QuickMenu'nun index'i
    //             showFlexibleBottomSheet(
    //                 minHeight: 0, // Değiştirin: 0 olarak ayarlandı
    //                 initHeight: 1,
    //                 maxHeight: 1,
    //                 context: context,
    //                 builder: (BuildContext context,
    //                     ScrollController scrollController, double offset) {
    //                   return Quickmenu(
    //                     items: quickMenuItems,
    //                     bottomSheetOffset: offset,
    //                     scrollController: scrollController,
    //                   );
    //                 },
    //                 anchors: [0, 1],
    //                 isSafeArea: true,
    //                 isDismissible:
    //                     false, //windows'ta çalışmıyor ama emülatör de çalışıyor
    //                 isModal: true);

    //           } else {
    //             controller.changeTabIndex(index);
    //           }
    //         },
    //       ),
    //     );
    //   }),
    // );
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

// Widget _bottombarItem(IconData icon, double size) {
//   return Container(
//     padding: EdgeInsets.all(4),
//     decoration: BoxDecoration(
//       shape: BoxShape.circle,
//       // Set the desired color for the icon
//     ),
//     child: Icon(icon, size: size, color: Colors.white), // Set the icon color
//   );
// }

PersistentBottomNavBarItem _navBarsItems(
  IconData icon,
  double size,
  String title,
) {
  return PersistentBottomNavBarItem(
    icon: Icon(
      icon,
      size: size,
      color: Colors.white,
    ),
    title: title,
  );
}
