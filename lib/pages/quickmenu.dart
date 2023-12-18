import 'package:dogus_app/server/data/itemQuickMenu.dart';

import 'package:flutter/material.dart';
import 'package:dogus_app/const/customScroll.dart';

List tags = [
  'one',
  'two',
  "three",
  "four",
  "five",
  "six",
  "seven",
  "eight",
  "nine",
  "ten"
];

class Quickmenu extends StatelessWidget {
  final ScrollController? scrollController;
  final double? bottomSheetOffset;
  final List<ItemQuickMenu> items;

  const Quickmenu({
    Key? key,
    this.scrollController,
    this.bottomSheetOffset,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: Container(
          decoration: BoxDecoration(color: Colors.black26),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
            child: ListView(
              controller: scrollController,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hızlı Menü",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Kapatma işlemi
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20, // İstenilen boşluk miktarını ayarlayın
                ),
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    for (var item in items)
                      Container(
                        width: 100,
                        height: 100,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(185, 0, 0, 0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                item.icon,
                                size: 20,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                item.title,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                              )
                            ],
                          ),
                        ),
                      )
                  ],
                ),

                //   color: Colors.red,
                //   height: 100,
                //   child: ListView.builder(
                //     itemCount: items?.length ?? 0, // Null kontrolü ekledim
                //     scrollDirection: Axis.horizontal,
                //     itemBuilder: (context, index) {
                //       final item = items?[index];
                //       return Container(
                //         width: 100,
                //         padding: EdgeInsets.only(top: 23),
                //         decoration: BoxDecoration(
                //           color: Colors.black45,
                //           borderRadius: BorderRadius.circular(10),
                //         ),
                //         margin: EdgeInsets.only(
                //           right: index == items!.length - 1 ? 30 : 5,
                //           left: index == 0 ? 30 : 5,
                //         ),
                //         child: Align(
                //           alignment: Alignment.center,
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.start,
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             children: [
                //               Icon(
                //                 item?.icon,
                //                 size: 25,
                //                 color: Colors.white,
                //               ),
                //               SizedBox(
                //                 height: 5,
                //               ),
                //               Text(
                //                 item!.title,
                //                 style: TextStyle(
                //                     color: Colors.white, fontSize: 14),
                //                 textAlign: TextAlign.center,
                //                 softWrap: true,
                //                 overflow: TextOverflow.ellipsis,
                //                 maxLines: 2,
                //               ),
                //             ],
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
