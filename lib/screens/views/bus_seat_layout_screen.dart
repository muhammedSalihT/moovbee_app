import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:moovbe_app/screens/models/buslist_model.dart';
import 'package:moovbe_app/screens/view_models/bus_seat_viewmodel.dart';
import 'package:moovbe_app/utils/constents.dart';
import 'package:provider/provider.dart';

class BusSeatLayoutScreen extends StatelessWidget {
  const BusSeatLayoutScreen({super.key, required this.busListModel});

  final BusListModel busListModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: Text(busListModel.subName),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppConstents.appSecondryColor),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Rohit Sharma",
                            style: TextStyle(
                                fontSize: 23,
                                color: AppConstents.kWhiteColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Lisence No: 675678687568",
                            style: TextStyle(
                                fontSize: 10,
                                color: AppConstents.kWhiteColor,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Image.asset(
                              "assets/99-996004_get-driving-directions-car-driver-removebg-preview 1.png"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SeatLayoutWidget(
                busListModel: busListModel,
                excludedColumn: busListModel.seatType == "1*3" ? 1 : 2),
          ],
        ),
      ),
    );
  }
}

class SeatLayoutWidget extends StatelessWidget {
  const SeatLayoutWidget(
      {super.key, required this.busListModel, required this.excludedColumn});

  final BusListModel busListModel;
  final int numColumns = 5;
  final int excludedColumn;

  @override
  Widget build(BuildContext context) {
    List<int> excludedIndices = [excludedColumn];
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
      child: Consumer<BusSeatViewModel>(builder: (context, busSeatProvider, _) {
        int totalRows = (busListModel.seatCount / numColumns + 1).ceil();
        log(busListModel.seatCount.toString());
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  color: AppConstents.appSecondryColor.withOpacity(.2))),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.chair,
                        size: 30,
                      ),
                    )
                  ],
                ),
                GridView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: numColumns,
                    childAspectRatio: 1.2,
                  ),
                  itemBuilder: (context, index) {
                    if (excludedIndices.contains(index % numColumns)) {
                      return const SizedBox();
                    }
                    return const Icon(
                      Icons.chair,
                      color: AppConstents.appPrimeryColor,
                      size: 30,
                    );
                  },
                  itemCount: busListModel.seatCount + totalRows,
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
