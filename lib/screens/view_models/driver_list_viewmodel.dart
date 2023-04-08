import 'package:flutter/material.dart';
import 'package:moovbe_app/screens/api/driver_api.dart';
import 'package:moovbe_app/screens/models/driver_model.dart';
import 'package:moovbe_app/utils/custom_snackbar.dart';
import 'package:moovbe_app/utils/internet_checking.dart';

class DriverListViewModel extends ChangeNotifier {
  List<DriverList> driverList = [];
  bool isInetrnet = true;

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
}
