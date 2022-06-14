import 'package:envapp/share/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'custom_button.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key, this.value}) : super(key: key);
  final double? value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Today",
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: Center(
              child: FAProgressBar(
            progressColor: AppColors.lightPurple,
            direction: Axis.vertical,
            verticalDirection: VerticalDirection.up,
            size: 120,
            currentValue: value!,
            changeColorValue: 100,
            changeProgressColor: Colors.red,
            maxValue: 20,
            displayText: " pH",
            borderRadius: BorderRadius.circular(16),
            backgroundColor: AppColors.secondColor,
            animatedDuration: const Duration(milliseconds: 100),
            displayTextStyle: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          )),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomButton(
          lable: "Set pH alert",
          onTap: () {
            print("data:");
          },
        ),
      ],
    );
  }
}
