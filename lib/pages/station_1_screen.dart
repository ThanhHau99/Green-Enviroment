import 'package:envapp/share/app_icons.dart';
import 'package:flutter/material.dart';
import '../model/station_1_model.dart';
import '../share/app_colors.dart';
import 'widgets/circle_widget.dart';
import 'widgets/header_widget.dart';

class Station1Screen extends StatefulWidget {
  final dynamic dataStation;
  const Station1Screen({Key? key, this.dataStation}) : super(key: key);

  @override
  State<Station1Screen> createState() => _Station1ScreenState();
}

class _Station1ScreenState extends State<Station1Screen> {
  late final dynamic jData;
  int indexTab = 0;
  @override
  void initState() {
    super.initState();
    jData = Station1Model.fromJson(widget.dataStation);
  }

  @override
  Widget build(BuildContext context) {
    print("dataStation: ${jData.humi}");
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
                          color: AppColors.secondColor,
                        ),
                        child: TabBar(
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: AppColors.primaryColor,
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
                                      AppIcons.tempWhite,
                                      scale: 2,
                                    )
                                  : Image.asset(
                                      AppIcons.tempBlack,
                                      scale: 2,
                                    ),
                              text: "Temperature",
                              height: 100,
                            ),
                            Tab(
                              icon: indexTab == 1
                                  ? Image.asset(
                                      AppIcons.dustWhite,
                                      scale: 1.5,
                                    )
                                  : Image.asset(
                                      AppIcons.dustBlack,
                                      scale: 1.5,
                                    ),
                              text: "Dust",
                            ),
                            Tab(
                              icon: indexTab == 2
                                  ? Image.asset(
                                      AppIcons.humiWhite,
                                      scale: 1.5,
                                    )
                                  : Image.asset(
                                      AppIcons.humiBlack,
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
                      Expanded(
                        child: TabBarView(
                          children: [
                            CircleWidget(
                              valueProgress: jData.temp,
                              valueUnit: "°C",
                              lableButton: "Set Temperature alert",
                            ),
                            CircleWidget(
                              valueProgress: jData.dust,
                              valueUnit: "mcg/m3",
                              lableButton: "Set Dust alert",
                            ),
                            CircleWidget(
                              valueProgress: jData.humi,
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
