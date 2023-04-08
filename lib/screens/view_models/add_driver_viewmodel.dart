import 'package:flutter/material.dart';
import 'package:moovbe_app/screens/api/driver_post_api.dart';
import 'package:moovbe_app/screens/view_models/driver_list_viewmodel.dart';
import 'package:moovbe_app/utils/custom_snackbar.dart';
import 'package:moovbe_app/utils/internet_checking.dart';
import 'package:moovbe_app/utils/routes.dart';
import 'package:provider/provider.dart';

class AddDriverViewModel extends ChangeNotifier {
  bool isAdding = false;
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lisenceController = TextEditingController();
  addDriverToList(context) async {
    if (formKey.currentState!.validate()) {
      final isInternet = await InternetConnectivity.checking();
      if (isInternet) {
        isAdding = true;
        notifyListeners();
        final result = await DriverPostApi.addDriver(nameController.text.trim(),
            "123456", lisenceController.text.trim());

        final driverListProvider =
            Provider.of<DriverListViewModel>(context, listen: false);
        driverListProvider.getDriverDetails(context);
        isAdding = false;
        notifyListeners();
        RoutesManager.backScreen();
        nameController.clear();
        lisenceController.clear();
        SnackBarWidget.getSnackBar(context: context, showText: result.message);
      } else {
        SnackBarWidget.getSnackBar(context: context, showText: "No Internet");
      }
    } else {
      SnackBarWidget.getSnackBar(
          context: context, showText: "Complete credentials");
    }
  }
}
