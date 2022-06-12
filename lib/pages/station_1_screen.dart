import 'package:flutter/material.dart';
import 'widgets/circle_widget.dart';
import 'widgets/header_widget.dart';

class Station1Screen extends StatefulWidget {
  const Station1Screen({Key? key}) : super(key: key);

  @override
  State<Station1Screen> createState() => _Station1ScreenState();
}

class _Station1ScreenState extends State<Station1Screen> {
  int indexTab = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const HeaderWidget(
                  title: "Station 1",
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
                                      "assets/temp_white.png",
                                      scale: 2,
                                    )
                                  : Image.asset(
                                      "assets/temp_black.png",
                                      scale: 2,
                                    ),
                              text: "Temperature",
                              height: 100,
                            ),
                            Tab(
                              icon: indexTab == 1
                                  ? Image.asset(
                                      "assets/dust_white.png",
                                      scale: 1.5,
                                    )
                                  : Image.asset(
                                      "assets/dust_black.png",
                                      scale: 1.5,
                                    ),
                              text: "Dust",
                            ),
                            Tab(
                              icon: indexTab == 2
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
                            CircleWidget(
                              valueProgress: 30,
                              valueUnit: "°C",
                              lableButton: "Set Temperature alert",
                            ),
                            CircleWidget(
                              valueProgress: 35,
                              valueUnit: "mcg/m3",
                              lableButton: "Set Dust alert",
                            ),
                            CircleWidget(
                              valueProgress: 40,
                              valueUnit: "%",
                              lableButton: "Set Humidity alert",
                            ),
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
