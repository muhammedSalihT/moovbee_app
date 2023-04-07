import 'package:flutter/material.dart';
import 'package:moovbe_app/screens/view_models/bus_seat_viewmodel.dart';
import 'package:moovbe_app/utils/constents.dart';
import 'package:provider/provider.dart';

class BusSeatLayoutScreen extends StatelessWidget {
  const BusSeatLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: const Text("Ksrtc scania"),
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
                        children: [
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
                      child: Image.asset(
                          "assets/99-996004_get-driving-directions-car-driver-removebg-preview 1.png"),
                    )
                  ],
                ),
              ),
            ),
            const SeatLayoutWidget(),
          ],
        ),
      ),
    );
  }
}

class SeatLayoutWidget extends StatelessWidget {
  const SeatLayoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
      child: Consumer<BusSeatViewModel>(builder: (context, busSeatProvider, _) {
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
                    Icon(
                      Icons.chair,
                      size: 30,
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    height: 40,
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.chair,
                                          size: 30,
                                          color: Colors.red,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Visibility(
                                          visible: busSeatProvider.isChanged
                                              ? false
                                              : true,
                                          child: const Icon(
                                            Icons.chair,
                                            size: 30,
                                            color: Colors.red,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                itemCount: 8),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    height: 40,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Icon(
                                          Icons.chair,
                                          size: 30,
                                          color: Colors.red,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Icon(
                                          Icons.chair,
                                          size: 30,
                                          color: Colors.red,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Visibility(
                                          visible: busSeatProvider.isChanged
                                              ? true
                                              : false,
                                          child: const Icon(
                                            Icons.chair,
                                            size: 30,
                                            color: Colors.red,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                itemCount: 8),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          busSeatProvider.changeSeatLayout();
                        },
                        child: Text(
                          "Change to ${busSeatProvider.isChanged ? "2*2" : "1*3"}",
                          style: const TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
