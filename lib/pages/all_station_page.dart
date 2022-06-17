import 'package:envapp/data/station_data.dart';
import 'package:envapp/pages/station_screen.dart';
import 'package:envapp/share/app_colors.dart';
import 'package:envapp/share/app_icons.dart';
import 'package:flutter/material.dart';
import '../model/station_model.dart';
import 'widgets/alert_dialog_widget.dart';

class AllStationPage extends StatefulWidget {
  const AllStationPage({Key? key}) : super(key: key);

  @override
  State<AllStationPage> createState() => _AllStationPageState();
}

class _AllStationPageState extends State<AllStationPage> {
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
                                    if (station[index].isActive!) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => StationScreen(
                                            dataStation:
                                                station[index].dataStation,
                                            stationName: station[index].name,
                                          ),
                                        ),
                                      );
                                    } else {
                                      showDialog<String>(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialogWidget(
                                          stationName: station[index].name,
                                        ),
                                      );
                                    }
                                  },
                                  child: CustomContainer(
                                    title: station[index].name,
                                    isActive: station[index].isActive,
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
  final bool? isActive;
  const CustomContainer({
    Key? key,
    this.title,
    this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient:
            isActive! ? AppColors.primaryColor : AppColors.secondColorGradient,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            isActive! ? AppIcons.stationWhite : AppIcons.stationpurple,
          ),
          Text(
            title!,
            style: TextStyle(
              fontSize: 18,
              color: isActive! ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}