import "package:dogus_app/navbar/navbar.dart";
import 'package:dogus_app/pages/quickmenu.dart';
import 'package:dogus_app/pages/home.dart';
import 'package:dogus_app/pages/login.dart';
import "package:dogus_app/pages/note.dart";
import "package:dogus_app/pages/profile.dart";
import "package:dogus_app/pages/setting.dart";
import "package:get/get.dart";

class AppPage {
  static List<GetPage> routes = [
    GetPage(name: navbar, page: () => const Navbar()),
    GetPage(name: login, page: () => const LoginPage()),
    GetPage(name: home, page: () => const Home()),
    GetPage(name: note, page: () => const Note()),
    // GetPage(name: chart, page: () => const QuickMenu()),
    GetPage(name: setting, page: () => const Setting()),
    GetPage(name: profile, page: () => const Profile()),
  ];
  //
  static getnavbar() => navbar;
  static getlogin() => login;
  static gethome() => home;
  static getnote() => note;
  // static getquickmenu() => quickmenu;
  static getsetting() => setting;
  static getprofile() => profile;

  //
  static String navbar = "/";
  static String login = "/login";
  static String home = "/home";
  static String note = "/note";
  // static String chart = "/quickmenu";
  static String setting = "/setting";
  static String profile = "/profile";
}
