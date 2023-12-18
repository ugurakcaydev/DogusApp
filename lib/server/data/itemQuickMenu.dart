import 'package:flutter/material.dart';

class ItemQuickMenu {
  final String title;
  final IconData icon;
  final String link;

  ItemQuickMenu({required this.title, required this.icon, required this.link});
}

List<ItemQuickMenu> quickMenuItems = [
  ItemQuickMenu(title: "Yoklama", icon: Icons.home, link: "/studentcalendar"),
  ItemQuickMenu(
      title: "Sınav Takvimi", icon: Icons.work, link: "/studentcalendar"),
  ItemQuickMenu(
      title: "Akademik Takvim", icon: Icons.settings, link: "/settings"),
  ItemQuickMenu(
      title: "Alınan Dersleri", icon: Icons.settings, link: "/settings"),
  ItemQuickMenu(
      title: "Sınav Sonuçları", icon: Icons.settings, link: "/settings"),
  ItemQuickMenu(
      title: "Dönem Ortalamaları", icon: Icons.settings, link: "/settings"),
  ItemQuickMenu(title: "Transkript", icon: Icons.settings, link: "/settings"),
  ItemQuickMenu(
      title: "Ders Programı", icon: Icons.settings, link: "/settings"),
  ItemQuickMenu(
      title: "Harç Bilgileri", icon: Icons.settings, link: "/settings"),
  ItemQuickMenu(
      title: "Devamsızlık Durumu", icon: Icons.settings, link: "/settings"),
  ItemQuickMenu(
      title: "Akademik Durum ", icon: Icons.settings, link: "/settings"),
  ItemQuickMenu(title: "Müfredat", icon: Icons.settings, link: "/settings"),
  ItemQuickMenu(
      title: "Yapılacaklar Listesi", icon: Icons.settings, link: "/settings"),
  ItemQuickMenu(
      title: "Akademik Danışman", icon: Icons.settings, link: "/settings"),
  ItemQuickMenu(
      title: "Hazırlık Bilgileri", icon: Icons.settings, link: "/settings"),
];
