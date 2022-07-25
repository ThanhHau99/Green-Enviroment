import 'package:flutter/material.dart';
import 'station_screen.dart';
import 'widgets/widgets.dart';
import '../data/station_data.dart';
import '../model/station_model.dart';
import '../share/share.dart';

class AllStationPage extends StatefulWidget {
  const AllStationPage({Key? key}) : super(key: key);

  @override
  State<AllStationPage> createState() => _AllStationPageState();
}

class _AllStationPageState extends State<AllStationPage> {
  final stationData = StationData();
  Future<void> _onRefresh() async {
    await stationData.load();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "All Station",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.blackText,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: RefreshIndicator(
                  color: AppColors.lightGreen,
                  onRefresh: _onRefresh,
                  child: FutureBuilder<List<StationModel>>(
                      future: stationData.load(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: AppColors.lightGreen,
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
                        return station!.isEmpty
                            ? SingleChildScrollView(
                                physics: const AlwaysScrollableScrollPhysics(),
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height - 100,
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                    child: Text(
                                      "There aren't any Station!",
                                      style: TextStyle(
                                        fontSize: 23,
                                        color: AppColors.hintText,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : GridView.builder(
                                itemCount: station.length,
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
                                              stationID:
                                                  station[index].stationID,
                                            ),
                                          ),
                                        );
                                      } else {
                                        showDialog<String>(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialogWidget(
                                            title: "Alert",
                                            text:
                                                "${station[index].stationID} isn't active",
                                            enableIcon: false,
                                          ),
                                        );
                                      }
                                    },
                                    child: CustomContainer(
                                      title: station[index].stationID,
                                      isActive: station[index].isActive,
                                    ),
                                  );
                                },
                              );
                      }),
                ),
              ),
            ],
          ),
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
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient:
            isActive! ? AppColors.primaryColor : AppColors.secondColorGradient,
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Opacity(
              opacity: isActive! ? 0 : 1,
              child: Image.asset(
                AppIcons.inactive,
                scale: 3.5,
              ),
            ),
          ),
          Image.asset(
            isActive! ? AppIcons.stationWhite : AppIcons.stationpurple,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            title!,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: isActive! ? AppColors.whiteText : AppColors.blackText,
            ),
          ),
        ],
      ),
    );
  }
}
