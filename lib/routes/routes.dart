import "package:dogus_app/navbar/navbar.dart";
import 'package:dogus_app/pages/quickmenu.dart';
import 'package:dogus_app/pages/home.dart';
import 'package:dogus_app/pages/login.dart';
import 'package:dogus_app/pages/mylessons.dart';
import "package:dogus_app/pages/profile.dart";
import "package:dogus_app/pages/setting.dart";
import "package:dogus_app/screens/StudentCalendar/index.dart";
import "package:get/get.dart";

class AppPage {
  static String navbar = "/";
  static String login = "/login";
  static String home = "/home";
  static String mylessons = "/mylessons";
  static String setting = "/setting";
  static String profile = "/profile";
  static String studentcalendar = "/studentcalendar";

  static List<GetPage> routes = [
    GetPage(name: navbar, page: () => const Navbar()),
    GetPage(name: login, page: () => const LoginPage()),
    GetPage(name: home, page: () => const Home()),
    GetPage(name: mylessons, page: () => const MyLessons()),
    GetPage(name: setting, page: () => const Setting()),
    GetPage(name: profile, page: () => const Profile()),
    GetPage(name: studentcalendar, page: () => const StudentCalendar()),
  ];

  static getnavbar() => navbar;
  static getlogin() => login;
  static gethome() => home;
  static getmylessons() => mylessons;
  static getsetting() => setting;
  static getprofile() => profile;
  static getstudentcalendar() => studentcalendar;
}
