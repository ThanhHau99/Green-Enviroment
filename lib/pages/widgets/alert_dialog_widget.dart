import 'package:envapp/share/app_colors.dart';
import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({
    Key? key,
    this.stationName,
  }) : super(key: key);

  final String? stationName;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.secondColor,
      contentPadding: const EdgeInsets.fromLTRB(24.0, 15.0, 24.0, 5.0),
      title: const Text(
        "Notification",
        style: TextStyle(fontSize: 22),
      ),
      content: Text(
        "$stationName isn't active",
        style: const TextStyle(fontSize: 20),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "OK",
            style: TextStyle(fontSize: 20, color: AppColors.purple),
          ),
        ),
      ],
    );
  }
}
