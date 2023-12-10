import 'package:dogus_app/pages/home.dart';
import 'package:dogus_app/widgets/input_box.dart';
import 'package:dogus_app/widgets/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

// void checkLogin(BuildContext context, String username, password) async {
//   try {
//     Response response =
//         await post(Uri.parse("https://reqres.in/api/login"), body: {
//       "email": "eve.holt@reqres.in",
//       "password": "cityslicka",
//     });

//     if (response.statusCode == 200) {
//       // Navigator.of(context)
//       //     .push(MaterialPageRoute(builder: (context) => HomePage()));

//       print("account login succsess");
//     } else {
//       print("hata");
//     }
//   } catch (e) {
//     print(e.toString());
//   }
// }

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  // bool check = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.black12, // Renk kodu başına '0x' ekleyerek belirtilir
                Colors.black87,
              ],
            ),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                //LOGO
                Container(
                  width: 180,
                  height: 180,
                  margin: EdgeInsets.only(top: 50),
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(100),
                  //   border: Border.all(
                  //       width: 1,
                  //       color: const Color.fromARGB(255, 154, 160, 239)),
                  // ),
                  child: Container(
                    child: Image.asset("images/Dogus_universitesi_logo.png"),
                  ),
                ),

                //LOGİN TEXT
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "GİRİŞ YAP",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ),

                //TABBAR MENU
                TabBarComponent(),

                //INPUT_1
                InputBox(
                  labelText: "Kullanıcı adı",
                  icon: Icons.people,
                  type: "username",
                  controller: usernameController,
                ),

                //INPUT_2

                InputBox(
                  labelText: "Şifre",
                  icon: Icons.lock,
                  type: "password",
                  controller: passwordController,
                ),

                //FORGOT_PASSWORD
                MouseRegion(
                  child: InkWell(
                    child: Container(
                      margin: EdgeInsets.only(left: 50, right: 50, bottom: 20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Şifremi unuttum",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.lightBlueAccent,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ),

                //LOGIN_BUTTON
                // MouseRegion(
                //   child: InkWell(
                //     onTap: () {
                //       setState(() {
                //         checkLogin(usernameController.text.toString(),
                //             passwordController.text.toString());
                //         print("Giris Yap Basıldı");
                //       });
                //     },
                //     child: Container(
                //       margin: EdgeInsets.symmetric(vertical: 20),
                //       width: MediaQuery.of(context).size.width,
                //       padding:
                //           EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                //       decoration: BoxDecoration(
                //           border: Border.all(width: 1, color: Colors.white),
                //           borderRadius: BorderRadius.all(
                //             Radius.circular(100),
                //           ),
                //           color: Colors.lightBlueAccent),
                //       child: Text(
                //         "GİRİŞ YAP",
                //         style: TextStyle(
                //             fontSize: 15,
                //             fontWeight: FontWeight.w600,
                //             color: Colors.white),
                //         textAlign: TextAlign.center,
                //       ),
                //     ),
                //   ),
                // )

                //LOGİN BUTTON
                Container(
                  margin: EdgeInsets.only(left: 50, right: 50, bottom: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // checkLogin(context, usernameController.text.toString(),
                        //     passwordController.text.toString());
                        Get.toNamed("/");
                      });
                    },
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Giriş Yap",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: Colors.lightBlue,
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),

                // Text(
                //   "Burası Senin Batışın :)",
                //   style: TextStyle(color: Colors.white, fontSize: 24),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
