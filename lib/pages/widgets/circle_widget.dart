import 'package:envapp/share/app_colors.dart';
import 'package:envapp/share/app_icons.dart';
import 'package:flutter/material.dart';
import 'bottom_sheet_widget.dart';
import 'circle_propress.dart';
import 'custom_button.dart';

class CircleWidget extends StatefulWidget {
  final double? value;
  final double? warningValue;
  final String? unit;
  final String? lableButton;
  final String? stationName;
  final String? warningName;

  const CircleWidget({
    Key? key,
    this.value,
    this.warningValue,
    this.unit,
    this.lableButton,
    this.stationName,
    this.warningName,
  }) : super(key: key);

  @override
  State<CircleWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<CircleWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    _animation =
        Tween<double>(begin: 0, end: widget.value).animate(_animationController)
          ..addListener(() {
            setState(() {});
          });
    _animationController.forward();
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
                foregroundPainter: CircleProgress(_animation.value),
                child: Center(
                    child: Text(
                  "${_animation.value.toInt()} ${widget.unit}",
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                )),
              ),
            ),
          ),
        ),
        CustomButton(
          lable: widget.lableButton,
          lableColor: AppColors.whiteText,
          gradient: AppColors.primaryColor,
          onTap: () {
            showBottomSheet(
              enableDrag: false,
              context: context,
              builder: (BuildContext context) {
                return BottomSheetWidget(
                  title: widget.lableButton,
                  warningValue: widget.warningValue,
                  stationName: widget.stationName,
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
