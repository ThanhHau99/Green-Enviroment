import 'package:envapp/share/app_icons.dart';
import 'package:flutter/material.dart';

import '../model/station_2_model.dart';
import '../share/app_colors.dart';
import 'widgets/header_widget.dart';
import 'widgets/progress_bar.dart';
import 'widgets/wave_widget.dart';

class Station2Screen extends StatefulWidget {
  final dynamic dataStation;
  const Station2Screen({Key? key, this.dataStation}) : super(key: key);

  @override
  State<Station2Screen> createState() => _Station2ScreenState();
}

class _Station2ScreenState extends State<Station2Screen> {
  late final dynamic jData;
  int indexTab = 0;
  @override
  void initState() {
    super.initState();
    jData = Station2Model.fromJson(widget.dataStation);
  }

  @override
  Widget build(BuildContext context) {
    print("object: ${jData.pH}");
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
                                      AppIcons.waterLevelWhite,
                                      scale: 1.5,
                                    )
                                  : Image.asset(
                                      AppIcons.waterLevelBlack,
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
                                      AppIcons.pHWhite,
                                      scale: 1.5,
                                    )
                                  : Image.asset(
                                      AppIcons.pHBlack,
                                      scale: 1.5,
                                    ),
                              text: "pH",
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
                            WaveWidget(
                              value: jData.waterLevel,
                            ),
                            ProgressBar(
                              value: jData.pH,
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
