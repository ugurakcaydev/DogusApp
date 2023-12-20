import 'package:dogus_app/pages/home.dart';
import 'package:dogus_app/pages/mylessons.dart';
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
        MyLessons(),
        Container(), //QuickMenu
        Setting(),
        Container() //Notifications
      ],
      items: [
        _navBarsItems(Icons.deblur_outlined, 22, "Ana Sayfa"),
        _navBarsItems(Icons.class_outlined, 22, "Alınan Dersler"),
        _navBarsItems(
            Icons.grid_view_sharp, 22, "Hızlı Menü"), //Icons.apps_outlined
        _navBarsItems(Icons.list_alt_outlined, 22,
            "Sınav Sonuçları"), //Icons.deblur_sharp, Icons.insert_chart_outlined_rounded
        _navBarsItems(Icons.notifications_on_outlined, 22, "Bildirimler")
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
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        colorBehindNavBar: Colors.green,
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
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }
}

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
    activeColorPrimary: Colors.white,
  );
}
