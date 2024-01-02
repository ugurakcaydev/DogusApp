import 'package:flutter/material.dart';

class ItemQuickMenu {
  final String title;
  final IconData icon;
  final String link;

  ItemQuickMenu({required this.title, required this.icon, required this.link});
}

List<ItemQuickMenu> quickMenuItems = [
  ItemQuickMenu(
      title: "Devamsızlık Durumu",
      icon: Icons.person_search_rounded,
      link: "/classattendance"),
  ItemQuickMenu(
      title: "Sınav Takvimi", icon: Icons.work, link: "/studentcalendar"),
  ItemQuickMenu(
      title: "Akademik Takvim",
      icon: Icons.calendar_month_outlined,
      link: "/academiccalendar"),
  ItemQuickMenu(
      title: "Alınan Dersler", icon: Icons.play_lesson, link: "/mylessons"),
  ItemQuickMenu(
      title: "Sınav Sonuçları", icon: Icons.settings, link: "/resultofexam"),
  ItemQuickMenu(
      title: "Dönem Ortalamaları",
      icon: Icons.bar_chart_rounded,
      link: "/semesteraverages"),
  ItemQuickMenu(title: "Transkript", icon: Icons.settings, link: "/settings"),
  ItemQuickMenu(
      title: "Ders Programı", icon: Icons.book_online, link: "/studentprogram"),
  ItemQuickMenu(
      title: "Harç Bilgileri", icon: Icons.settings, link: "/settings"),
  // ItemQuickMenu(
  //     title: "Devamsızlık Durumu", icon: Icons.settings, link: "/settings"),
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
