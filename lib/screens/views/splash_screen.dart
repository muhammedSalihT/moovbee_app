import 'package:flutter/material.dart';
import 'package:moovbe_app/screens/views/login_screen.dart';
import 'package:moovbe_app/utils/constents.dart';
import 'package:moovbe_app/utils/responsive.dart';
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
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: GestureDetector(
                onTap: () =>
                    RoutesManager.removeScreen(screen: const LoginScreen()),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  width: double.infinity,
                  height: Responsive.getHeight(context) * .07,
                  child: Center(
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                          color: AppConstents.appPrimeryColor, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
