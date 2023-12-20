import 'package:dogus_app/const/customScroll.dart';
import 'package:flutter/material.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';

class Profile extends StatefulWidget {
  final ScrollController? scrollController;
  final double? bottomSheetOffset;

  const Profile({
    Key? key,
    this.scrollController,
    this.bottomSheetOffset,
  }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
        color: Colors.red[400],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Duyurular",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ContainedTabBarView(
                tabs: [
                  Text('Duyurular', style: TextStyle(color: Colors.white)),
                  Text('Bildirimler', style: TextStyle(color: Colors.white)),
                ],
                views: [
                  Container(
                    color: Colors.white,
                    child: Center(child: Text('Duyurular')),
                  ),
                  Container(
                    color: Colors.white,
                    child: Center(child: Text('Bildirimler')),
                  ),
                ],
                onChange: (index) => print(index),
                //final Color? indicatorColor: Colors.white, // indicatorColor'ı doğrudan tanımlayın
              ),
            ),
          ],
        ),
      ),
    );
  }
}
