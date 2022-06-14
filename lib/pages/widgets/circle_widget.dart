import 'package:envapp/share/app_icons.dart';
import 'package:flutter/material.dart';
import 'circle_propress.dart';
import 'custom_button.dart';

class CircleWidget extends StatefulWidget {
  final double? valueProgress;
  final String? valueUnit;
  final String? lableButton;

  const CircleWidget({
    Key? key,
    this.valueProgress,
    this.valueUnit,
    this.lableButton,
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
    _animation = Tween<double>(begin: 0, end: widget.valueProgress)
        .animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Today",
          style: TextStyle(fontSize: 18),
        ),
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
                  "${_animation.value.toInt()} ${widget.valueUnit}",
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
          onTap: () {
            print("data: ${widget.valueProgress}");
          },
        ),
      ],
    );
  }
}
