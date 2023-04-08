import 'package:flutter/material.dart';
import 'package:moovbe_app/screens/views/add_driver_screen.dart';
import 'package:moovbe_app/screens/views/widgets/custom_button_widget.dart';
import 'package:moovbe_app/utils/constents.dart';
import 'package:moovbe_app/utils/responsive.dart';
import 'package:moovbe_app/utils/routes.dart';

class ManageDriverScreen extends StatelessWidget {
  const ManageDriverScreen({super.key});

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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: const [
                  Text(
                    "21",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text("Drivers found", style: TextStyle(fontSize: 20)),
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
                    return Container(
                      height: 100,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: AppConstents.kWhiteColor,
                          borderRadius:
                              BorderRadiusDirectional.all(Radius.circular(15))),
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.brown.shade50,
                              borderRadius: const BorderRadiusDirectional.only(
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
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Rohit Sharma",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Lisc No:7574636",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: ElevatedButton(
                                onPressed: () {}, child: const Text("Delete")),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: 15),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: CustomButtonWidget(
                title: const Text(
                  "Add driver",
                  style:
                      TextStyle(color: AppConstents.kWhiteColor, fontSize: 20),
                ),
                onTap: () {
                  RoutesManager.nextScreen(screen: const AddDriverScreen());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
