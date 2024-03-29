import 'package:flutter/material.dart';
import 'all_station_page.dart';
import '../share/share.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 5000)).then((value) =>
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const AllStationPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppIcons.logo,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CircularProgressIndicator(
                      color: AppColors.lightGreen,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppIcons.logoTDTU,
                    scale: 10,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    AppIcons.logoTHColor,
                    scale: 9,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
