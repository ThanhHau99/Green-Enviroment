import 'package:flutter/material.dart';
import 'package:envapp/share/share.dart';
import 'package:intl/intl.dart';

class TopAlertWidget extends StatelessWidget {
  TopAlertWidget({Key? key, this.sensorName}) : super(key: key);
  final String? sensorName;
  final String dateTime =
      DateFormat("HH:mm, dd/MM/yyyy").format(DateTime.now()).toString();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.whiteText,
            width: 2.5,
          ),
          borderRadius: BorderRadius.circular(20),
          gradient: AppColors.primaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      AppIcons.exclamation,
                      scale: 5,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "NOTICE",
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.whiteText,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Text(
                  dateTime,
                  style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: AppColors.whiteText,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "The $sensorName has exceeded the allowable limit",
              style: TextStyle(
                fontSize: 18,
                color: AppColors.whiteText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
