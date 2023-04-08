import 'package:flutter/material.dart';
import 'package:moovbe_app/screens/views/login_screen.dart';
import 'package:moovbe_app/screens/views/widgets/custom_button_widget.dart';
import 'package:moovbe_app/utils/constents.dart';
import 'package:moovbe_app/utils/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstents.appPrimeryColor,
      body: Stack(
        children: [
          Center(
            child: Image.asset("assets/logo.png"),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomButtonWidget(
                title: const Text(
                  "Get Started",
                  style: TextStyle(
                      color: AppConstents.appPrimeryColor, fontSize: 20),
                ),
                backgrounColor: AppConstents.kWhiteColor,
                titleColor: AppConstents.appPrimeryColor,
                onTap: () {
                  RoutesManager.removeScreen(screen: const LoginScreen());
                }),
          )
        ],
      ),
    );
  }
}
