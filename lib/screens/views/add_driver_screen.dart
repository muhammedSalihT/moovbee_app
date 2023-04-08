import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moovbe_app/screens/view_models/add_driver_viewmodel.dart';
import 'package:moovbe_app/screens/views/widgets/custom_button_widget.dart';
import 'package:moovbe_app/screens/views/widgets/custom_textfield_widget.dart';
import 'package:moovbe_app/utils/constents.dart';
import 'package:provider/provider.dart';

class AddDriverScreen extends StatelessWidget {
  const AddDriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addDriverProvider = Provider.of<AddDriverViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: const Text("Add Driver"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Form(
            key: addDriverProvider.formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CustomTextField(
                      hintText: "Enter Name",
                      controller: addDriverProvider.nameController),
                ),
                CustomTextField(
                    hintText: "Enter Licence Number",
                    controller: addDriverProvider.lisenceController),
              ],
            ),
          ),
          CustomButtonWidget(
            title: addDriverProvider.isAdding
                ? const CupertinoActivityIndicator(
                    color: AppConstents.kWhiteColor,
                    radius: 15,
                  )
                : const Text(
                    "Save",
                    style: TextStyle(
                        color: AppConstents.kWhiteColor, fontSize: 20),
                  ),
            onTap: () async {
              addDriverProvider.addDriverToList(context);
            },
          )
        ],
      ),
    );
  }
}
