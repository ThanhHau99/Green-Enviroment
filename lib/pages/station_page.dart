import 'package:envapp/data/station_data.dart';
import 'package:envapp/share/app_colors.dart';
import 'package:envapp/share/app_icons.dart';
import 'package:flutter/material.dart';

import '../model/station_model.dart';
import 'station_1_screen.dart';
import 'station_2_screen.dart';
import 'station_3_screen.dart';

class StationPage extends StatefulWidget {
  const StationPage({Key? key}) : super(key: key);

  @override
  State<StationPage> createState() => _StationPageState();
}

class _StationPageState extends State<StationPage> {
  final stationData = StationData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      "All Station",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: FutureBuilder<List<StationModel>>(
                          future: stationData.load(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.lightPurple,
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text(
                                  snapshot.hasError.toString(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              );
                            }
                            final station = snapshot.data;
                            return GridView.builder(
                              itemCount: station!.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          if (station[index].id == "ST001") {
                                            return Station1Screen(
                                              dataStation:
                                                  station[index].dataStation,
                                            );
                                          } else if (station[index].id ==
                                              "ST002") {
                                            return Station2Screen(
                                              dataStation:
                                                  station[index].dataStation,
                                            );
                                          } else {
                                            return const Station3Screen();
                                          }
                                        },
                                      ),
                                    );
                                  },
                                  child: CustomContainer(
                                    title: station[index].name,
                                  ),
                                );
                              },
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final String? title;
  const CustomContainer({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: AppColors.primaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AppIcons.stationWhite,
          ),
          Text(
            title!,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
