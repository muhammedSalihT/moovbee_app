import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moovbe_app/screens/models/driver_model.dart';
import 'package:moovbe_app/screens/view_models/driver_list_viewmodel.dart';
import 'package:moovbe_app/screens/views/add_driver_screen.dart';
import 'package:moovbe_app/screens/views/widgets/custom_button_widget.dart';
import 'package:moovbe_app/utils/constents.dart';
import 'package:moovbe_app/utils/responsive.dart';
import 'package:moovbe_app/utils/routes.dart';
import 'package:provider/provider.dart';

class DriverListScreen extends StatefulWidget {
  const DriverListScreen({super.key});

  @override
  State<DriverListScreen> createState() => _DriverListScreenState();
}

class _DriverListScreenState extends State<DriverListScreen> {
  @override
  void initState() {
    final provider = Provider.of<DriverListViewModel>(context, listen: false);
    provider.getDriverDetails(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: const Text("Drivers List"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Consumer<DriverListViewModel>(
            builder: (context, driverListProvider, _) {
          if (driverListProvider.isInetrnet == false) {
            return RefreshIndicator(
              onRefresh: () => driverListProvider.getDriverDetails(context),
              child: Column(
                children: [
                  const Center(child: Text("No Internet")),
                  Center(
                    child: ElevatedButton(
                        onPressed: () =>
                            driverListProvider.getDriverDetails(context),
                        child: const Text("Try again")),
                  )
                ],
              ),
            );
          } else {
            if (driverListProvider.driverList.isEmpty) {
              log(driverListProvider.driverList.toString());
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Center(
                    child: CupertinoActivityIndicator(
                        color: AppConstents.appPrimeryColor, radius: 30),
                  )
                ],
              );
            } else {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Text(
                          driverListProvider.driverList.length.toString(),
                          style: const TextStyle(fontSize: 20),
                        ),
                        const Text(" Drivers found",
                            style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Responsive.getHeight(context) * .6,
                    child: ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 15,
                          );
                        },
                        itemBuilder: (context, index) {
                          final driverDeatils =
                              driverListProvider.driverList[index];
                          return Container(
                            height: 100,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                color: AppConstents.kWhiteColor,
                                borderRadius: BorderRadiusDirectional.all(
                                    Radius.circular(15))),
                            child: Row(
                              children: [
                                Container(
                                  height: 100,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.brown.shade50,
                                    borderRadius:
                                        const BorderRadiusDirectional.only(
                                            topStart: Radius.circular(15),
                                            bottomStart: Radius.circular(15)),
                                  ),
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.transparent,
                                    child: Image.asset(
                                      fit: BoxFit.fill,
                                      "assets/Ellipse.png",
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              driverDeatils.name,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              "Lisc No:${driverDeatils.licenseNo}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              showAlertDialog(
                                                context: context,
                                                driverDeatils: driverDeatils,
                                              );
                                            },
                                            child: const Text("Delete"))
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: driverListProvider.driverList.length),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: CustomButtonWidget(
                      title: const Text(
                        "Add driver",
                        style: TextStyle(
                            color: AppConstents.kWhiteColor, fontSize: 20),
                      ),
                      onTap: () {
                        RoutesManager.nextScreen(
                            screen: const AddDriverScreen());
                      },
                    ),
                  )
                ],
              );
            }
          }
        }),
      ),
    );
  }

  showAlertDialog({
    required BuildContext context,
    required DriverList driverDeatils,
  }) {
    final alert = Consumer<DriverListViewModel>(
        builder: (context, driverListProvider, _) {
      return AlertDialog(
        title: const Text(
          "Are you sure you want Delete?",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        backgroundColor: AppConstents.appPrimeryColor,
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          driverListProvider.isDeleting
              ? const CupertinoActivityIndicator(
                  color: AppConstents.kWhiteColor,
                  radius: 15,
                )
              : ElevatedButton(
                  onPressed: () async {
                    driverListProvider.isDeleting
                        ? null
                        : driverListProvider.deleteDriverFromList(
                            context: context,
                            driverId: driverDeatils.id.toString());
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: const Text(
                    "Yes",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
            ),
            child: const Text(
              "No",
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      );
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
