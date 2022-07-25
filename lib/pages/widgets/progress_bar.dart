import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'widgets.dart';
import '../../share/share.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar(
      {Key? key,
      this.value,
      this.warningValue,
      this.stationID,
      this.warningName,
      this.sensorName})
      : super(key: key);
  final double? value;
  final double? warningValue;
  final String? stationID;
  final String? warningName;
  final String? sensorName;

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  void initState() {
    super.initState();
    checkWarning();
  }

  @override
  void didUpdateWidget(covariant ProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    checkWarning();
  }

  void checkWarning() {
    if (widget.value! > widget.warningValue!) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        showTopSnackBar(
          context,
          TopAlertWidget(
            sensorName: widget.sensorName,
          ),
        );
      });
    }
  }

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
            currentValue: widget.value!,
            changeColorValue: widget.warningValue!.toInt(),
            changeProgressColor: AppColors.red,
            maxValue: 14,
            displayText: " pH",
            borderRadius: BorderRadius.circular(16),
            backgroundColor: AppColors.secondColor,
            animatedDuration: const Duration(milliseconds: 700),
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
          lable: "Set ${widget.sensorName} alert",
          lableColor: AppColors.whiteText,
          gradient: AppColors.primaryColor,
          onTap: () {
            showBottomSheet(
              enableDrag: false,
              context: context,
              builder: (BuildContext context) {
                return BottomSheetWidget(
                  title: "Set ${widget.sensorName} alert",
                  warningValue: widget.warningValue,
                  stationID: widget.stationID,
                  warningName: widget.warningName,
                );
              },
            );
          },
        ),
      ],
    );
  }
}
