import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {
  const TabWidget({
    Key? key,
    this.enableTab,
    this.index,
    this.text,
    this.iconWhite,
    this.iconBlack,
    this.scale,
    this.iconMargin,
  }) : super(key: key);

  final bool? enableTab;
  final int? index;
  final String? iconWhite;
  final String? iconBlack;
  final double? scale;
  final String? text;
  final EdgeInsetsGeometry? iconMargin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      child: Tab(
        icon: enableTab!
            ? Image.asset(
                iconWhite!,
                scale: scale,
              )
            : Image.asset(
                iconBlack!,
                scale: scale,
              ),
        text: text,
        height: 100,
        iconMargin: iconMargin ?? const EdgeInsets.only(bottom: 10.0),
      ),
    );
  }
}
