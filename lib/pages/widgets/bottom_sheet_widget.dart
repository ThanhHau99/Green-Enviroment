import 'package:flutter/material.dart';

import '../../share/app_colors.dart';
import 'custom_button.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    Key? key,
    this.title,
    required this.onTap,
  }) : super(key: key);

  final String? title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        color: AppColors.secondColor,
      ),
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Opacity(
                  opacity: 0,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.close),
                    iconSize: 30,
                  ),
                ),
                Text(
                  title!,
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                  iconSize: 30,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter value",
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: AppColors.purple),
                  ),
                ),
                cursorColor: AppColors.purple,
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              lable: "Save",
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
