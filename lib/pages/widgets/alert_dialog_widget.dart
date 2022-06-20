import 'package:envapp/pages/widgets/custom_button.dart';
import 'package:envapp/share/app_colors.dart';
import 'package:envapp/share/app_icons.dart';
import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({
    Key? key,
    this.title,
    this.text,
    this.enableIcon,
  }) : super(key: key);

  final String? title;
  final String? text;
  final bool? enableIcon;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      content: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          gradient: AppColors.primaryColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                enableIcon!
                    ? Icon(
                        Icons.check_circle_outline,
                        color: AppColors.whiteText,
                        size: 28,
                      )
                    : Image.asset(
                        AppIcons.exclamation,
                        scale: 5,
                      ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title!,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: AppColors.whiteText,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              text!,
              style: const TextStyle(fontSize: 23, color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
                lable: "OK",
                lableColor: AppColors.lightGreen,
                gradient: AppColors.whiteGradient,
                onTap: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
