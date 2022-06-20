import 'package:envapp/share/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:wave_progress_widget/wave_progress_widget.dart';
import 'bottom_sheet_widget.dart';
import 'custom_button.dart';

class WaveWidget extends StatelessWidget {
  const WaveWidget(
      {Key? key,
      this.value,
      this.warningValue,
      this.stationName,
      this.warningName})
      : super(key: key);
  final double? value;
  final double? warningValue;
  final String? stationName;
  final String? warningName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WaveProgress(
                250,
                AppColors.lightGreen,
                AppColors.lightGreen,
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
          lableColor: AppColors.whiteText,
          gradient: AppColors.primaryColor,
          onTap: () {
            showBottomSheet(
              enableDrag: false,
              context: context,
              builder: (BuildContext context) {
                return BottomSheetWidget(
                  title: "Set Water level alert",
                  warningValue: warningValue,
                  stationName: stationName,
                  warningName: warningName,
                );
              },
            );
          },
        ),
      ],
    );
  }
}
