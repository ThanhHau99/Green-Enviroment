import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:wave_progress_widget/wave_progress.dart';
import 'widgets.dart';
import '../../share/share.dart';

class WaveWidget extends StatefulWidget {
  const WaveWidget(
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
  State<WaveWidget> createState() => _WaveWidgetState();
}

class _WaveWidgetState extends State<WaveWidget> {
  bool? isWarning;
  @override
  void initState() {
    super.initState();
    checkWarning();
  }

  @override
  void didUpdateWidget(covariant WaveWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    checkWarning();
  }

  void checkWarning() {
    if (widget.value! > widget.warningValue!) {
      isWarning = true;
      SchedulerBinding.instance.addPostFrameCallback((_) {
        showTopSnackBar(
          context,
          TopAlertWidget(
            sensorName: widget.sensorName,
          ),
        );
      });
    } else {
      isWarning = false;
    }
  }

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
                isWarning! ? AppColors.red : AppColors.lightGreen,
                isWarning! ? AppColors.red : AppColors.lightGreen,
                widget.value,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "${widget.value} cm",
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
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
