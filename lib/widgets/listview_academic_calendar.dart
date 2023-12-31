import 'package:dogus_app/const/customScroll.dart';

import 'package:dogus_app/server/data/itemAcedemicCalendar.dart';
import 'package:flutter/material.dart';

class ListviewAcademicCalendar extends StatefulWidget {
  final String title;
  final List<ItemAcademicCalendar> items;

  const ListviewAcademicCalendar({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  @override
  _ListviewAcademicCalendarState createState() =>
      _ListviewAcademicCalendarState();
}

class _ListviewAcademicCalendarState extends State<ListviewAcademicCalendar> {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyCustomScrollBehavior(),
      child: Container(
        // color: Colors.amber,
        padding: EdgeInsets.only(top: 12, bottom: 12),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(color: Colors.white70, fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .pushNamed("/academiccalendar");
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black26),
                      child: Row(
                        children: [
                          Text(
                            "Tümü",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.edit_calendar,
                            color: Colors.white,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 80,
              child: ListView.builder(
                itemCount: widget.items.length > 3 ? 3 : widget.items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final item = widget.items[index];
                  return Container(
                    margin: EdgeInsets.only(
                      right: index == widget.items.length - 1 ? 30 : 5,
                      left: index == 0 ? 30 : 5,
                    ),
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 75,
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment:
                                CrossAxisAlignment.center, // Bu satırı ekleyin
                            children: [
                              Text(
                                "27",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Kasım",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.only(left: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  item.title,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(item.startingdate,
                                        style: TextStyle(color: Colors.white)),
                                    SizedBox(width: 5),
                                    Text(
                                      "-",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(width: 5),
                                    Text(item.endingdate,
                                        style: TextStyle(color: Colors.white))
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
