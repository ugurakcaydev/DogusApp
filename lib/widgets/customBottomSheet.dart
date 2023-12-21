import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:dogus_app/pages/notification.dart';
import 'package:dogus_app/pages/quickmenu.dart';
import 'package:dogus_app/server/data/itemQuickMenu.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

void showCustomBottomSheet(int index, BuildContext context,
    PersistentTabController _controller, int _currentIndex) {
  double? initHeight;
  double? minHeight;
  double? maxHeight;
  List<double>? anchors;
  Widget screen = Container();

  switch (index) {
    case 2: //QuickMenu
      minHeight = 0;
      initHeight = 1;
      maxHeight = 1;
      anchors = [0, 1];
      screen = Quickmenu(
        items: quickMenuItems,
      );
      break;
    case 4: //Notification
      minHeight = 0;
      initHeight = 0.5;
      maxHeight = 1;
      anchors = [0, 0.5, 1];
      screen = NotificationsPage();
      break;
  }
  showFlexibleBottomSheet(
    minHeight: minHeight,
    initHeight: initHeight,
    maxHeight: maxHeight,
    context: context,
    builder: (BuildContext context, ScrollController scrollController,
        double offset) {
      return screen;
    },
    anchors: anchors,
    isSafeArea: true,
    isDismissible: true,
    isModal: true,
  );
  _controller.index = _currentIndex;
}
