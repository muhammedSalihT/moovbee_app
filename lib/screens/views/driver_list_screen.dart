import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                                            onPressed: () {},
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
}
