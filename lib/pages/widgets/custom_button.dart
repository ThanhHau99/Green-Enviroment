import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.lable,
    this.lableColor,
    this.onTap,
    this.gradient,
  }) : super(key: key);

  final String? lable;
  final Color? lableColor;
  final Function()? onTap;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: gradient,
        ),
        child: Center(
          child: Text(
            lable!,
            style: TextStyle(
              fontSize: 20,
              color: lableColor,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
    );
  }
}
