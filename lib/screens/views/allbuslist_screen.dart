import 'package:flutter/material.dart';
import 'package:moovbe_app/screens/view_models/bus_list_viewmodel.dart';
import 'package:moovbe_app/screens/views/bus_seat_layout_screen.dart';
import 'package:moovbe_app/screens/views/manage_driver_screen.dart';
import 'package:moovbe_app/utils/constents.dart';
import 'package:moovbe_app/utils/responsive.dart';
import 'package:moovbe_app/utils/routes.dart';
import 'package:provider/provider.dart';

class AllBusListScreen extends StatelessWidget {
  const AllBusListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final busListProvider = Provider.of<BusListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        centerTitle: true,
        title: Image.asset(
          "assets/logo.png",
          height: 50,
          fit: BoxFit.fill,
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomGridWidget(
                  heading: "Bus",
                  subHeading: "Manage your bus",
                  gridImage: "assets/image 2.png",
                  onTap: () {}),
              CustomGridWidget(
                heading: "Driver",
                subHeading: "Manage your Driver",
                gridImage:
                    "assets/99-996004_get-driving-directions-car-driver-removebg-preview 1.png",
                onTap: () {
                  RoutesManager.nextScreen(screen: const ManageDriverScreen());
                },
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: const [
                        Text(
                          "4 ",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text("Buses Found", style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 15,
                          );
                        },
                        itemBuilder: (context, index) {
                          final busDetails = busListProvider.busList[index];
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
                                  child: Image.asset(
                                    fit: BoxFit.fitWidth,
                                    busDetails.busImage,
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
                                              busDetails.busName,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              busDetails.subName,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              RoutesManager.nextScreen(
                                                  screen: BusSeatLayoutScreen(
                                                busListModel: busDetails,
                                              ));
                                            },
                                            child: const Text("Manage"))
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        itemCount: busListProvider.busList.length),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomGridWidget extends StatelessWidget {
  const CustomGridWidget({
    super.key,
    required this.heading,
    required this.subHeading,
    required this.gridImage,
    required this.onTap,
  });

  final String heading;
  final String subHeading;
  final String gridImage;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: Responsive.getWidth(context) * .5,
          width: Responsive.getWidth(context) * .42,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: heading == "Bus"
                  ? AppConstents.appPrimeryColor
                  : AppConstents.appSecondryColor),
          child: Padding(
            padding: heading == "Bus"
                ? const EdgeInsets.fromLTRB(20, 15, 0, 0)
                : const EdgeInsets.fromLTRB(20, 15, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  heading,
                  style: const TextStyle(
                      fontSize: 25,
                      color: AppConstents.kWhiteColor,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  subHeading,
                  style: const TextStyle(
                      fontSize: 10, color: AppConstents.kWhiteColor),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        gridImage,
                        height: heading == "Bus"
                            ? Responsive.getWidth(context) * .28
                            : Responsive.getWidth(context) * .31,
                        width: Responsive.getWidth(context) * .3,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
