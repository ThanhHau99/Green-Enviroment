import 'package:envapp/share/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:wave_progress_widget/wave_progress_widget.dart';
import 'custom_button.dart';

class WaveWidget extends StatelessWidget {
  const WaveWidget({Key? key, this.value}) : super(key: key);
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WaveProgress(
                250,
                AppColors.lightPurple,
                AppColors.lightPurple,
                value,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "$value cm",
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomButton(
          lable: "Set Water level alert",
          onTap: () {
            print("data:");
          },
        ),
      ],
    );
  }
}
