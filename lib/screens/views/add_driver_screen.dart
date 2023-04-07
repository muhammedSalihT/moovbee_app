import 'package:flutter/material.dart';
import 'package:moovbe_app/screens/views/widgets/custom_button_widget.dart';
import 'package:moovbe_app/screens/views/widgets/custom_textfield_widget.dart';
import 'package:moovbe_app/utils/routes.dart';

class AddDriverScreen extends StatelessWidget {
  const AddDriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: const Text("Add Driver"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: CustomTextField(hintText: "Enter Name"),
              ),
              CustomTextField(hintText: "Enter Licence Number"),
            ],
          ),
          CustomButtonWidget(
            title: "Save",
            onTap: () {
              RoutesManager.backScreen();
            },
          )
        ],
      ),
    );
  }
}
