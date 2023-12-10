import 'package:flutter/material.dart';

class ItemQuickMenu {
  final String title;
  final IconData icon;
  final String link;

  ItemQuickMenu({required this.title, required this.icon, required this.link});
}

List<ItemQuickMenu> quickMenuItems = [
  ItemQuickMenu(title: "Item 1", icon: Icons.home, link: "/home"),
  ItemQuickMenu(title: "Item 2", icon: Icons.work, link: "/work"),
  ItemQuickMenu(title: "Item 3", icon: Icons.settings, link: "/settings"),
  ItemQuickMenu(title: "Item 4", icon: Icons.settings, link: "/settings"),
  ItemQuickMenu(title: "Item 5", icon: Icons.settings, link: "/settings"),
  ItemQuickMenu(title: "Item 6", icon: Icons.settings, link: "/settings"),
  ItemQuickMenu(title: "Item 7", icon: Icons.settings, link: "/settings"),
];

class ItemAcademicCalendar {
  final String title;
  final String date;

  ItemAcademicCalendar({
    required this.title,
    required this.date,
  });
}

List<ItemAcademicCalendar> academicCalendarItems = [
  ItemAcademicCalendar(
      title: "Ara Sınav Not Girişi", date: "13 Kasım - 27 Kasım"),
  ItemAcademicCalendar(
      title: "Ara Sınav Notlarının Öğrenciye Yayınlanması", date: "27 Kasım"),
];
