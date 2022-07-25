import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'widgets.dart';
import '../../share/share.dart';

class CircleWidget extends StatefulWidget {
  final double? value;
  final double? warningValue;
  final String? unit;
  final String? sensorName;
  final String? stationID;
  final String? warningName;

  const CircleWidget({
    Key? key,
    this.value,
    this.warningValue,
    this.unit,
    this.sensorName,
    this.stationID,
    this.warningName,
  }) : super(key: key);

  @override
  State<CircleWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<CircleWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool? isWarning;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));

    animationCustom();
    checkWarning();
  }

  @override
  void didUpdateWidget(covariant CircleWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    animationCustom();
    checkWarning();
  }

  void animationCustom() {
    _animation =
        Tween<double>(begin: 0, end: widget.value).animate(_animationController)
          ..addListener(() {
            setState(() {});
          });
    _animationController.forward();
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
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: Image.asset(AppIcons.circleOutline).image,
                    scale: 1.4),
              ),
              child: CustomPaint(
                foregroundPainter: CircleProgress(_animation.value, isWarning!),
                child: Center(
                  child: Text(
                    "${_animation.value.toInt()} ${widget.unit}",
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
          ),
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
