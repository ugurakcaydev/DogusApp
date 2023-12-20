import 'package:dogus_app/server/data/announcements.dart';
import 'package:flutter/material.dart';

class Announcements extends StatefulWidget {
  const Announcements({Key? key}) : super(key: key);

  @override
  _AnnouncementsState createState() => _AnnouncementsState();
}

class _AnnouncementsState extends State<Announcements> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Duyurular",
                  style: TextStyle(color: Colors.white70, fontSize: 20),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text(
                      //   "Tümü",
                      //   style: TextStyle(color: Colors.white, fontSize: 12),
                      // ),
                      // SizedBox(
                      //   width: 10,
                      // ),
                      Icon(
                        Icons.campaign_sharp,
                        color: Colors.white,
                        size: 25,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(bottom: 30),
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffc1121f),
              ),
              child: announcements.isEmpty
                  ? Container(
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.bookmark_add_outlined,
                            color: Colors.white,
                            size: 25,
                          ),
                          Text(
                            "Duyuru Bulunmamaktadır.",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: announcements.length,
                        itemBuilder: (context, index) {
                          final announcement = announcements[index];
                          return Container(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 8),
                                  width: 100,
                                  color: Colors.black26,
                                  child: Text(
                                    announcement.announcsTitle ?? "",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                    softWrap: true,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                  child: Text(
                                    announcement.announcsComment ?? "",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                    softWrap: true,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ))
        ],
      ),
    );
  }
}
