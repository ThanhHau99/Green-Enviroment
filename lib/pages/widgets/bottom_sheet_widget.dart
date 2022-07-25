import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'widgets.dart';
import '../../data/station_data.dart';
import '../../share/share.dart';

class BottomSheetWidget extends StatelessWidget {
  BottomSheetWidget({
    Key? key,
    this.title,
    this.warningValue,
    this.stationID,
    this.warningName,
  }) : super(key: key);

  final String? title;
  final double? warningValue;
  final String? stationID;
  final String? warningName;

  final TextEditingController _controller = TextEditingController();
  final stationData = StationData();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        gradient: AppColors.primaryColor,
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  AppIcons.close,
                  scale: 2.5,
                ),
              ),
            ),
            Text(
              title!,
              style: TextStyle(
                fontSize: 28,
                color: AppColors.whiteText,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.whiteText, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: "Current value: $warningValue",
                    hintStyle: TextStyle(
                      color: AppColors.hintText,
                    ),
                    filled: true,
                    fillColor: AppColors.whiteText,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  cursorColor: AppColors.lightGreen,
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
              lable: "Save",
              lableColor: AppColors.lightGreen,
              gradient: AppColors.whiteGradient,
              onTap: () {
                if (_controller.value.text.isNotEmpty) {
                  Navigator.pop(context);
                  updateValue(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void updateValue(BuildContext context) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result) {
      double value = double.parse(_controller.value.text).toDouble();
      stationData.updateWarningValue(stationID!, warningName!, value);
    }
    showDialog<String>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => AlertDialogWidget(
        title: result ? "Completion" : "Alert",
        text: result
            ? "Warning value update successful"
            : "Warning value update unsuccessful",
        enableIcon: result,
      ),
    );
  }
}
