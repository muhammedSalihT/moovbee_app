import 'package:flutter/material.dart';
import 'package:moovbe_app/utils/constents.dart';
import 'package:moovbe_app/utils/responsive.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.title,
    this.backgrounColor = AppConstents.appPrimeryColor,
    this.titleColor = AppConstents.kWhiteColor,
    required this.onTap,
  });

  final String title;
  final Color backgrounColor;
  final Color titleColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: backgrounColor),
          width: double.infinity,
          height: Responsive.getHeight(context) * .07,
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: titleColor, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
