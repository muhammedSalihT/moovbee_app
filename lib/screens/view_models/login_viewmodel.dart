import 'package:flutter/material.dart';
import 'package:moovbe_app/screens/api/login_api.dart';
import 'package:moovbe_app/screens/views/allbuslist_screen.dart';
import 'package:moovbe_app/utils/custom_snackbar.dart';
import 'package:moovbe_app/utils/routes.dart';
import 'package:moovbe_app/utils/secure_store.dart';

class LoginViewModel extends ChangeNotifier {
  bool userChecking = false;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  verifyUser(context) async {
    if (formKey.currentState!.validate()) {
      userChecking = true;
      notifyListeners();
      final result = await LoginApi.userLogin(
          userName: emailController.text.trim(),
          password: passController.text.trim());
      if (result.message == "Check Your Internet") {
        userChecking = false;
        notifyListeners();
        SnackBarWidget.getSnackBar(
            context: context, showText: "Check Your Internet");
      }
      if (result.status == true) {
        await SecureStore.saveToken(result.access.toString());
        await SecureStore.saveApiKey(result.urlId.toString());
        await SecureStore.getApiKey();
        SnackBarWidget.getSnackBar(context: context, showText: result.message);
        userChecking = false;
        notifyListeners();
        RoutesManager.removeScreen(screen: const AllBusListScreen());
      }
      if (result.message == "invalid credentials!") {
        userChecking = false;
        notifyListeners();
        SnackBarWidget.getSnackBar(
            context: context, showText: "invalid credentials");
      }
    } else {
      SnackBarWidget.getSnackBar(
          context: context, showText: "Complete credentials");
    }
  }
}
