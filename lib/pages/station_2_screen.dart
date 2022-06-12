import 'package:flutter/material.dart';

import 'widgets/header_widget.dart';

class Station2Screen extends StatefulWidget {
  const Station2Screen({Key? key}) : super(key: key);

  @override
  State<Station2Screen> createState() => _Station2ScreenState();
}

class _Station2ScreenState extends State<Station2Screen> {
  int indexTab = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const HeaderWidget(
                  title: "Station 2",
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFFF0F0F0),
                        ),
                        child: TabBar(
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.topLeft,
                              colors: [
                                Color(0xFF7E78EE),
                                Color.fromARGB(255, 197, 195, 235),
                              ],
                            ),
                          ),
                          unselectedLabelColor: Colors.black,
                          onTap: (int index) {
                            setState(() {
                              indexTab = index;
                            });
                          },
                          tabs: [
                            Tab(
                              icon: indexTab == 0
                                  ? Image.asset(
                                      "assets/water_level_white.png",
                                      scale: 1.5,
                                    )
                                  : Image.asset(
                                      "assets/water_level_black.png",
                                      scale: 1.5,
                                    ),
                              iconMargin:
                                  const EdgeInsets.only(top: 10, bottom: 20),
                              text: "Water level",
                              height: 100,
                            ),
                            Tab(
                              icon: indexTab == 1
                                  ? Image.asset(
                                      "assets/humi_white.png",
                                      scale: 1.5,
                                    )
                                  : Image.asset(
                                      "assets/humi_black.png",
                                      scale: 1.5,
                                    ),
                              text: "Humidity",
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Expanded(
                        child: TabBarView(
                          children: [
                            Text("data01"),
                            Text("data02"),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
