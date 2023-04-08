import 'package:flutter/material.dart';
import 'package:moovbe_app/screens/api/driver_delete_api.dart';
import 'package:moovbe_app/screens/api/driver_fetch_api.dart';
import 'package:moovbe_app/screens/models/driver_model.dart';
import 'package:moovbe_app/utils/custom_snackbar.dart';
import 'package:moovbe_app/utils/internet_checking.dart';
import 'package:moovbe_app/utils/routes.dart';

class DriverListViewModel extends ChangeNotifier {
  List<DriverList> driverList = [];
  final formKey = GlobalKey<FormState>();
  bool isInetrnet = true;
  bool isDeleting = false;
  getDriverDetails(context) async {
    final isInternet = await InternetConnectivity.checking();
    if (isInternet) {
      final result = await DriverListApi.getDriverDeatils();
      driverList.clear();
      driverList = result.driverList;
      notifyListeners();
    } else {
      SnackBarWidget.getSnackBar(
          context: context, showText: "Check Your Internet");
    }
  }

  deleteDriverFromList({required String driverId, context}) async {
    final isInternet = await InternetConnectivity.checking();
    if (isInternet) {
      isDeleting = true;
      notifyListeners();
      final result = await DriverDeleteApi.deleteDriver(driverId: driverId);
      getDriverDetails(context);
      isDeleting = false;
      notifyListeners();
      RoutesManager.backScreen();
      SnackBarWidget.getSnackBar(context: context, showText: result.message);
    } else {
      SnackBarWidget.getSnackBar(context: context, showText: "No Internet");
    }
  }
}
