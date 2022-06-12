import 'package:flutter/material.dart';

class Station3Screen extends StatefulWidget {
  const Station3Screen({Key? key}) : super(key: key);

  @override
  State<Station3Screen> createState() => _Station3ScreenState();
}

class _Station3ScreenState extends State<Station3Screen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Station 3 screen"),
      ),
    );
  }
}
