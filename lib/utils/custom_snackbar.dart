import 'package:flutter/material.dart';
import 'package:moovbe_app/utils/constents.dart';

class SnackBarWidget {
  static getSnackBar({context, String? showText}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppConstents.appSecondryColor,
        behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.all(15),
        shape: const StadiumBorder(),
        content: Center(
          child: Text(
            showText!,
            style: const TextStyle(
                fontSize: 14,
                color: AppConstents.kWhiteColor,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
