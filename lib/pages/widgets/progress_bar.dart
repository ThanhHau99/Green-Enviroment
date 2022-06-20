import 'package:envapp/share/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'bottom_sheet_widget.dart';
import 'custom_button.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar(
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
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: Center(
              child: FAProgressBar(
            progressColor: AppColors.lightGreen,
            direction: Axis.vertical,
            verticalDirection: VerticalDirection.up,
            size: 120,
            currentValue: value!,
            changeColorValue: 100,
            changeProgressColor: AppColors.red,
            maxValue: 20,
            displayText: " pH",
            borderRadius: BorderRadius.circular(16),
            backgroundColor: AppColors.secondColor,
            animatedDuration: const Duration(milliseconds: 100),
            displayTextStyle: TextStyle(
              fontSize: 18,
              color: AppColors.whiteText,
            ),
          )),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomButton(
          lable: "Set pH alert",
          lableColor: AppColors.whiteText,
          gradient: AppColors.primaryColor,
          onTap: () {
            showBottomSheet(
              enableDrag: false,
              context: context,
              builder: (BuildContext context) {
                return BottomSheetWidget(
                  title: "Set pH alert",
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
