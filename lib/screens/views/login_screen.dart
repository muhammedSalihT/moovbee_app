import 'package:flutter/material.dart';
import 'package:moovbe_app/screens/view_models/login_viewmodel.dart';
import 'package:moovbe_app/screens/views/allbuslist_screen.dart';
import 'package:moovbe_app/utils/constents.dart';
import 'package:moovbe_app/utils/responsive.dart';
import 'package:moovbe_app/utils/routes.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginViewModel>(context);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: Responsive.getHeight(context) * .3,
                    width: double.infinity,
                    color: const Color(0xff2B2B2B),
                    child: Image.asset(
                      "assets/Polygon 1.png",
                      height: Responsive.getHeight(context) * .3,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Form(
                      key: loginProvider.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                0, Responsive.getHeight(context) * .17, 0, 0),
                            child: Text(
                              "Welcome",
                              style: TextStyle(
                                  color: AppConstents.kWhiteColor,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            "Manage your bus and drivers",
                            style: TextStyle(
                                letterSpacing: 2.5,
                                color: AppConstents.kWhiteColor,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: CustomTextField(hintText: "Enter Username"),
              ),
              const CustomTextField(hintText: "Enter Password"),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: GestureDetector(
                onTap: () =>
                    RoutesManager.nextScreen(screen: const AllBusListScreen()),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppConstents.appPrimeryColor),
                  width: double.infinity,
                  height: Responsive.getHeight(context) * .07,
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: AppConstents.kWhiteColor, fontSize: 20),
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

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
  });

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      child: TextFormField(
        textAlign: TextAlign.center,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Enter $hintText";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade300,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}

// class TextFormWidget extends StatelessWidget {
//   final bool hideData;
//   final String hint;
//   final IconData icon;
//   final TextInputType textType;
//   final String label;
//   final TextEditingController controller;
//   final Widget? suffixIcon;

//   const TextFormWidget({
//     Key? key,
//     required this.hideData,
//     required this.hint,
//     required this.icon,
//     required this.textType,
//     required this.label,
//     required this.controller,
//     this.suffixIcon,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 35.0, right: 35.0),
//       child: Column(
//         children: [
//           TextFormField(
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return "Enter Something";
//               } else {
//                 return null;
//               }
//             },
//             controller: controller,
//             keyboardType: textType,
//             obscureText: hideData,
//             style: TextStyle(
//               color: blackColor,
//               fontSize: 22.0,
//               fontWeight: FontWeight.w900,
//             ),
//             // controller: _mobileController,
//             decoration: InputDecoration(
//               label: Text(label),
//               prefixIcon: Icon(icon),
//               suffix: suffixIcon,
//               border: const OutlineInputBorder(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(20.0),
//                 ),
//               ),
//               hintText: hint,
//               hintStyle: const TextStyle(color: Colors.grey),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
